class Node {
    constructor(value){
        this.value = value;
        this.child = new Map();
        this.endOfWord = false;
    }
}

class AutoComplete {

    getNamesArray() {
           return getTextFile();
    }

    autoCompletion(input, nameArray) {
        var root = new Node(null);
        var nodeCurrent;
        var words;

        for (let str of nameArray)
            insert(str);

        var currentFocus;
        
        input.addEventListener('input', function (e) {
            closeAllLists();
            
            currentFocus = -1;
            var inputstr = this.value;
            if (inputstr == null || inputstr == '')
                return;

            var divContainer;
            divContainer = document.createElement('DIV');
            divContainer.setAttribute('id', this.id + 'autocomplete-list');
            divContainer.setAttribute('class', 'autocomplete-items');
            
            this.parentNode.appendChild(divContainer);

            nodeCurrent = findLastNode(inputstr.toLowerCase());
            if (nodeCurrent == null)
                return;

            words = new Array();
            autoCompletionR(nodeCurrent, inputstr, words);

            if (words == null)
                words = new Array();

            var elementdiv;
            for (let element of words) {
                elementdiv = document.createElement('DIV');
                elementdiv.innerHTML = '<strong>' + element.substr(0, inputstr.length) + '</strong>';
                elementdiv.innerHTML += element.substr(inputstr.length);
                elementdiv.innerHTML += "<input type='hidden' value='" + element + "'>";

                elementdiv.addEventListener('click', function (e) {
                    input.value = this.getElementsByTagName('input')[0].value;
                    closeAllLists();
                })

                divContainer.appendChild(elementdiv);
            }
        })

        input.addEventListener("keydown", function (e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x) x = x.getElementsByTagName("div");
            if (e.keyCode == 40) {
                currentFocus++;
                addActive(x);
            } else if (e.keyCode == 38) {
                currentFocus--;
                addActive(x);
            } else if (e.keyCode == 13) {
                e.preventDefault();
                if (currentFocus > -1) {
                    if (x)
                        x[currentFocus].click();
                }
            }
        })

        function addActive(x) {
            if (!x)
                return false;

            removeActive(x);

            if (currentFocus >= x.length)
                currentFocus = 0;

            if (currentFocus < 0)
                currentFocus = (x.length - 1);

            x[currentFocus].classList.add("autocomplete-active");
        }

        function removeActive(x) {
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }

        function closeAllLists(elmnt) {
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != input) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }

        function autoCompletionR(nodeCurrent, input, words) {
            if (nodeCurrent.endOfWord == true)
                words.push(input.toLowerCase());

            for (let node of getChild(nodeCurrent))
                autoCompletionR(node, input + node.value, words);
        }

        function insert(str) {
            if (str == null || str == '')
                return;

            nodeCurrent = root;

            for (let char of str.toLowerCase().split('')) {
                if (notDuplicated(char))
                    addNode(char);

                forwardToNext(char);
            }

            nodeCurrent.endOfWord = true;
        }

        function findLastNode(input) {
            nodeCurrent = root;

            for (let char of input.split('')) {
                if (notDuplicated(char))
                    return null;

                forwardToNext(char);
            }
            return nodeCurrent;
        }

        function getChild(root) {
            return Array.from(root.child.values());
        }

        function notDuplicated(char) {
            return nodeCurrent.child.get(char) == null;
        }

        function addNode(char) {
            return nodeCurrent.child.set(char, new Node(char));
        }

        function forwardToNext(char) {
            nodeCurrent = nodeCurrent.child.get(char);
        }

        document.addEventListener("click", function (e) {
            closeAllLists(e.target);
        })
    }
}

function getTextFile(file) {
    var fileRaw = document.getElementById("fileloader");
    var fileArray = fileRaw.contentWindow.document.body.childNodes[0].innerHTML.split(",");

    return fileArray;
}

function start() {
    var a = new AutoComplete();
    a.autoCompletion(document.getElementById("myInput"), a.getNamesArray());
}

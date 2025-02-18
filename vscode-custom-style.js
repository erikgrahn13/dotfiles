// Function to remove "Visual Studio Code" from the title bar
function removeVSCodeText() {
    const titleElement = document.querySelector('.monaco-workbench .part.titlebar > .titlebar-container > .titlebar-center > .window-title');
    if (titleElement) {
        // Remove the " - Visual Studio Code" text while keeping the file name
        titleElement.textContent = titleElement.textContent.replace(/ - Visual Studio Code$/, '');
    }
}

// Observe the entire document for changes
const observer = new MutationObserver((mutationsList, observer) => {
    const targetElement = document.querySelector('.monaco-workbench .part.titlebar > .titlebar-container > .titlebar-center > .window-title');
    if (targetElement) {
        // Element found, stop observing and set up the MutationObserver
        observer.disconnect();
        new MutationObserver(removeVSCodeText).observe(
            targetElement,
            { childList: true, subtree: true }
        );
    }
});

// Start observing the document
observer.observe(document.body, { childList: true, subtree: true });
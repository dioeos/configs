// function get_workspace_idxs(workspaces, workspaceIdxs) {
//   for (int i = 0; i < workspaces.length; i++) {
//     workspaceIdxs.push(workspaces[i].idx)
//   }
// }
function get_workspace_idxs(workspaces) {
    var workspaceIdxs = []

    for (var i = 0; i < workspaces.length; i++) {
        workspaceIdxs.push(workspaces[i].idx)
    }

    return workspaceIdxs
}

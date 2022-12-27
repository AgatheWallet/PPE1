## 27/12/2022
1. Création d'un tag sur le commit 5a2874eae27726ab9e01ca2d83312ff78c5d8537 (en date du 28092022)
```bash
git tag -a -m "version finie séance 2" 20220928 5a2874eae27726ab9e01ca2d83312ff78c5d8537
git push origin 20220928
```
1. Création d'un tag sur le commit 5a2874eae27726ab9e01ca2d83312ff78c5d8537 (en date du 28092022)
```bash
git tag -a -m "version finie séance 2" 20220928 5a2874eae27726ab9e01ca2d83312ff78c5d8537
git push origin 20220928
```
2. Création d'une erreur et annulation du commit
- Ajout d'une phrase inutile au Jdb + add + commit avec message 'I AM ERROR'
- Ajout d'une section à la date d'aujourd'hui + add + commit + push
- Récupération de l'id SHA du commit erroné : 
```bash
git log
```
- Annulation du commit erroné 7f700438915e70241e9cb3aeb648fde4b8749349
```bash
git reset 7f700438915e70241e9cb3aeb648fde4b8749349
```
Je n'ai pas l'impression d'avoir réussi à annuler le commit en question. En effet, lorsque je fais un git status, on m'informe que je suis "en retard" d'un commit par rapport à origin/main, ce qui doit correspondre au reset. Je me suis dit qu'il fallait peut-être que je push le reset mais j'ai alors une erreur comme quoi il faut que je pull d'abord. Pour pouvoir puller, il faut que je reset mon journal de bord ce qui n'amène aucun changement in fine. J'ai alors essayé avec revert et le numéro du commit mais au lieu de me retirer le commit erreur, cela m'a retiré, j'ai l'impression, le commit correct que j'ai effectué après puisque ma section à la date d'aujourd'hui était supprimée du journal de bord.

Je réécris plein de choses inutiles en espérant que mon reset/revert fonctionne cette fois...

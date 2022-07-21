#අපි අපේ ඇප් එකක් ප්‍රොඩක්ශන් වලට දානවා නම් ඒක අනිවාර්යෙන් හොද සර්වර් එකකට දාන්න ඕනෙ
#සාමාන්‍යෙන් අපි ඩිවලොප් කරන කොට රන් කරල බලන්නෙ ඩිෆෝල්ට් එන ඩිවලොප්මන්ට් සර්වර් එකත් එක්ක#

#නමුත් ඒක ප්‍රොඩක්ශන් එකකට හොද නෑ ඒ නිසා අපි nginx වගේ සර්වර් පාවිච්චි කරනවා ඒක අපි බිල්ඩ් කරලා ගන්න ස්ටැටික් ෆයිල් එක්ක ගනුදෙනු කරනවා
#ඒ වගේම අපි බිල්ඩ් කරපු එක තමා ගන්නෙ මොකද ඒකේ සයිස් එක ගොඩක් අඩුයි අපේ නෝමල් ෆයිල් වලට වඩා
#නෝඩ් මොඩුල් එමත් ඕනෙ වෙන්නෙ නෑ ඒකට

#අපට මේක කරන්න වෙන්නෙ පියවර දෙකකට. මුලින්ම නෝඩ් තියන ඇල්පයින් එක අරගෙන අපට ඇප් එකේ බිල්ඩ් ෆෝල්ඩර් එක හද ගන්න වෙනවා
#ඊට පස්සෙ අපිට සිද්ද වෙනවා අලුත් nginx ඉමේජ් එක අරගෙන අරකෙන් ආව බිල්ඩ් ෆෝල්ඩර් එක මේකට කොපි කරන්න

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
#nginx වල මේ ෆෝල්ඩර් එකට තමා බිල්ඩ් වෙන ඒවා කොපි කරන්නේ
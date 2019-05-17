Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A6213F8
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:06:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454zq81pbkzDqRS
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 17:06:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HjkcbRT3"; 
 dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454zpf16FQzDqQV
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 17:05:58 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id z19so6813874qtz.13
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xM7g3yRQ5e24Oj8uWxvq7LXscMd2qvPy79hzR3ammas=;
 b=HjkcbRT3uT2ogQ56YABCo8eQPjcJw6xEvWkMqZ1neDh+DIsqWZufDJHy49HMMzsPvC
 2j6Aoswi6BAqTjgNIb1IKNVqfStRwFQrmzuWt0G24j2P/7cHboCqKkCmv1TiqUiR/U+y
 s9HJ5Iuqy9ew0d6cnOJ20olRJ32uurhtnz/nDxLOE1PuthVh0xYhfElFiflW9V26BdR2
 xFKY398/cr25eTBLkPBxSP+IS0yofowykS6qA3po1qlULAmJmi5jEicXyevDEgM4SDg1
 nFmLbAjRLLv3l1HNA0dy+2oAtnvGm8qpNq0t02Rp2Uk4wmdOlKCcrq/5XPNzfagGyATy
 vztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xM7g3yRQ5e24Oj8uWxvq7LXscMd2qvPy79hzR3ammas=;
 b=KheOXejXXQAqFe7aFfxTR9nfcEsHAhG8lpRNY5uEGGZwgwAVnvYhvWXWF1Azay9hDB
 enr9yb5Ct74w/GePTo4KlKpQmisqhqCZh615xnLsVzt3rv57bSuwhIlyO7VYbuIUqnQM
 tTSTZq8T8w2E/EV6zhMs1o0lAKy2NAJbVf4KPS7HF23Vi6PUL/DP7aNRRN2QJdHqWszK
 qJsRAPasMjwZiU724kz5+zObDNiegSqHszxTm3huskFL6YtL+w0bU7D2wJWNfJAvth2i
 Jj+QztKHGftjLs54gUBc/qBMS3GyZhSYDwIohX12tcDLvU869uglyopxvt0YkYFhJtJb
 4dGA==
X-Gm-Message-State: APjAAAXoZzVgx90rLpeOcDh2hWJT6xU73oHGkHrT/ZiD+28dlZt4JjH/
 4eWOHCZz3NXRPHR1bhzJATlijsV4m0cSskhSG0mhn8dy1lc=
X-Google-Smtp-Source: APXvYqycnaO6/u70L3BDovNG+dFMs6gqXhosh3zJnt7HsuNUMIg+JvrHmdWAXxKy905EDGH6wfSE2bDZhuAPjr6zfeE=
X-Received: by 2002:a0c:b5ad:: with SMTP id g45mr18588543qve.231.1558076755805; 
 Fri, 17 May 2019 00:05:55 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Fri, 17 May 2019 15:05:45 +0800
Message-ID: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
Subject: [phosphor-webui] Enable style-src 'unsafe-inline'
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000900cc805891003de"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000900cc805891003de
Content-Type: text/plain; charset="UTF-8"

Hi,
We would like to use angular-ui-grid module to support grid feature.

We found angular-ui-grid used a lot of inline styles.

To make it workable, we had to add "unsafe-inline" to CSP.
So we added the below modification in the phosphor-webui/webpack.config.js
     new CSPWebpackPlugin({
       'base-uri': '\'self\'',
       'object-src': '\'none\'',
   'script-src': ['\'self\''],
-      'style-src': ['\'self\''],
+      'style-src': ['\'self\'', '\'unsafe-inline\'' ],

But the grid could still not work.

Then we tried to modify the content of  CSP in the bmcweb
(include/security_headers_middleware.hpp)

@@ -41,7 +41,7 @@ struct SecurityHeadersMiddleware
       // img-src 'self' data: is used to allow that.
       //
https://stackoverflow.com/questions/18447970/content-security-policy-data-not-working-for-base64-images-in-chrome-28
       res.addHeader("Content-Security-Policy",
-                      "default-src 'self'; img-src 'self' data:");
+                      "default-src 'self'; style-src 'self'
'unsafe-inline'; img-src 'self' data:");
       res.addHeader("X-XSS-Protection", "1; "
                                           "mode=block");
       res.addHeader("X-Content-Type-Options", "nosniff");

The grid could be displayed normally.

Can anyone tell me why the modified CSP in the webpack.config.js had no
effect?

Thanks.

--000000000000900cc805891003de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi,<div>We would like to use angular-ui-grid mod=
ule to support grid feature.</div><div><br></div><div>We found angular-ui-g=
rid used a lot of inline styles.</div><div><br></div><div>To make it workab=
le, we had to add &quot;unsafe-inline&quot; to CSP.</div><div>So we added t=
he below modification in the phosphor-webui/webpack.config.js</div><div><di=
v>=C2=A0 =C2=A0 =C2=A0new CSPWebpackPlugin({</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;base-uri&#39;: &#39;\&#39;self\&#39;&#39;,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;object-src&#39;: &#39;\&#39;none\&#39;&#39;,</div><di=
v><span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0&#39;script-src&#39;=
: [&#39;\&#39;self\&#39;&#39;],</div><div>-=C2=A0 =C2=A0 =C2=A0 &#39;style-=
src&#39;: [&#39;\&#39;self\&#39;&#39;],</div><div>+=C2=A0 =C2=A0 =C2=A0 &#3=
9;style-src&#39;: [&#39;\&#39;self\&#39;&#39;, &#39;\&#39;unsafe-inline\&#3=
9;&#39; ],</div></div><div><br></div><div>But the grid could still not work=
.</div><div><br></div><div>Then we tried to modify the content of=C2=A0 CSP=
 in the bmcweb=C2=A0</div><div>(include/security_headers_middleware.hpp)</d=
iv><div><br></div><div><div>@@ -41,7 +41,7 @@ struct SecurityHeadersMiddlew=
are</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0// img-src &#39;self&#39; data: is=
 used to allow that.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0// <a href=3D"htt=
ps://stackoverflow.com/questions/18447970/content-security-policy-data-not-=
working-for-base64-images-in-chrome-28">https://stackoverflow.com/questions=
/18447970/content-security-policy-data-not-working-for-base64-images-in-chr=
ome-28</a></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0res.addHeader(&quot;Content=
-Security-Policy&quot;,</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;default-src &#39;self&#39;; im=
g-src &#39;self&#39; data:&quot;);</div><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;default-src &#39;sel=
f&#39;; style-src &#39;self&#39; &#39;unsafe-inline&#39;; img-src &#39;self=
&#39; data:&quot;);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0res.addHeader(&quo=
t;X-XSS-Protection&quot;, &quot;1; &quot;</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mode=3Dblo=
ck&quot;);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0res.addHeader(&quot;X-Conte=
nt-Type-Options&quot;, &quot;nosniff&quot;);</div></div><div><br></div><div=
>The grid could be displayed normally.</div><div><br></div><div>Can anyone =
tell me why the modified CSP in the webpack.config.js had no effect?</div><=
div><br></div><div>Thanks.</div><div><br></div></div></div></div></div></di=
v></div>

--000000000000900cc805891003de--

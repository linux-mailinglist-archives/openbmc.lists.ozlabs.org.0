Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0107E442
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 22:36:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4602BL5w8zzDqhm
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 06:36:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=email.dropbox.com
 (client-ip=54.240.60.165; helo=a60-165.smtp-out.us-west-2.amazonses.com;
 envelope-from=0101016c4edb5253-5333b105-6c2d-41d7-bc85-bda73c0cb6ba-000000@email.dropbox.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=dropbox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dropbox.com header.i=@dropbox.com header.b="hij9fVtp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=amazonses.com header.i=@amazonses.com
 header.b="DRhwjJ1r"; dkim-atps=neutral
X-Greylist: delayed 393 seconds by postgrey-1.36 at bilbo;
 Fri, 02 Aug 2019 06:31:31 AEST
Received: from a60-165.smtp-out.us-west-2.amazonses.com
 (a60-165.smtp-out.us-west-2.amazonses.com [54.240.60.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4602502FvZzDqcy
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 06:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=fwekda4pbtfzhnrtrrriuun7z25zrizq; d=dropbox.com; t=1564691092;
 h=Content-Type:MIME-Version:From:To:CC:Subject:Date:Message-ID:Reply-To;
 bh=rpXTf8FhbG7fgj3OCRc1Rsi1kXW973T5KCT0f8eB3w8=;
 b=hij9fVtpOEe5w1t67O4CstIYcsHQzFXUVToRDSWGkuuKjAynROJTUwc2bGNNST1R
 IfGrdvUpafWSe/AY2JaPtLDlR0jLFg8VPGpv8y6lCM8ulKBIjhaLKdGngfvVGR0o8Xf
 96ihn2kYkSb1bIvKmnJid2o0AQBrYBWnzphgN8eA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1564691092;
 h=Content-Type:MIME-Version:From:To:CC:Subject:Date:Message-ID:Reply-To:Feedback-ID;
 bh=rpXTf8FhbG7fgj3OCRc1Rsi1kXW973T5KCT0f8eB3w8=;
 b=DRhwjJ1rwGb3sSy/NzQ7D0JoXfKbcAtHJWEa+umb4PsDbBMpxQALHdTGveJYPY3y
 hB28HP636/4RxMF1uXS5U64pHf9MddTyF31pEPKksk2992cE2V7GMFhCmcZ6pApMWyC
 xan8eWin0Gk7D8hoDBXRv8O2mcnZpSsGygvg8axY=
Content-Type: multipart/alternative;
 boundary="===============5378081814455380666=="
MIME-Version: 1.0
From: "Vijay Khemka \(via Dropbox\)" <no-reply@dropbox.com>
To: openbmc@lists.ozlabs.org
CC: 
Subject: =?utf-8?q?Vijay_Khemka_shared_=22obmcdev=22_with_you?=
Date: Thu, 1 Aug 2019 20:24:52 +0000
Message-ID: <0101016c4edb5253-5333b105-6c2d-41d7-bc85-bda73c0cb6ba-000000@us-west-2.amazonses.com>
X-Dropbox-Message-ID: 8953012584659403885
X-SES-Outgoing: 2019.08.01-54.240.60.165
Feedback-ID: 1.us-west-2.C1J9pRCK9rJULWC8wBKFbk8/mhlW6tSneJoML9ymcSA=:AmazonSES
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
Reply-To: vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--===============5378081814455380666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi there,

Vijay Khemka (vijaykhemka@fb.com) invited you to view the folder " obmcdev =
" on Dropbox.

Go to folder[1]

Enjoy!
The Dropbox team

[1]: https://www.dropbox.com/l/scl/AAAud2xbRKh-ZiPBhcMsAVSTzJpVSaC_qwQ
--===============5378081814455380666==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml">
<head>
<meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type">
<style>
        @font-face {
            font-family: "proxima_nova";
            src: url("https://www.dropbox.com/static/fonts/proximanova/prox=
ima-nova-regular.otf") format("opentype");
            font-weight: normal;
            font-style: normal;
        }
         =

        a {
            color: #007ee6;
            text-decoration: none;
        }
        </style>
</head> <body style=3D"padding: 0; width: 100% !important; -webkit-text-siz=
e-adjust: 100%; margin: 0; -ms-text-size-adjust: 100%;" marginheight=3D"0" =
marginwidth=3D"0"><center><table cellpadding=3D"8" cellspacing=3D"0" style=
=3D"*width: 540px; padding: 0; width: 100% !important; background: #ffffff;=
 margin: 0; background-color: #ffffff;" border=3D"0"><tr><td valign=3D"top">
<table cellpadding=3D"0" cellspacing=3D"0" style=3D"border-radius: 4px; -we=
bkit-border-radius: 4px; border: 1px #dceaf5 solid; -moz-border-radius: 4px=
;" border=3D"0" align=3D"center">
<tr><td colspan=3D"3" height=3D"6"></td></tr>
<tr style=3D"line-height: 0px;"><td width=3D"100%" style=3D"font-size: 0px;=
" align=3D"center" height=3D"1"><img src=3D"https://cfl.dropboxstatic.com/s=
tatic/images/emails/logo_glyph_34_m1%402x.png" style=3D"max-height: 73px; w=
idth: 40px; *width: 40px; *height: 73px;" catalogid=3D"logo_glyph_34_2x_png=
" alt=3D"" width=3D"40px"></td></tr> <tr><td><table cellpadding=3D"0" cells=
pacing=3D"0" style=3D"line-height: 25px;" border=3D"0" align=3D"center">
<tr><td colspan=3D"3" height=3D"30"></td></tr>
<tr>
<td width=3D"36"></td>
<td width=3D"454" align=3D"left" style=3D"color: #444444; border-collapse: =
collapse; font-size: 11pt; font-family: proxima_nova, 'Open Sans', 'Lucida =
Grande', 'Segoe UI', Arial, Verdana, 'Lucida Sans Unicode', Tahoma, 'Sans S=
erif'; max-width: 454px;" valign=3D"top">Hi there,<br><br>Vijay Khemka (vij=
aykhemka@fb.com) invited you to view the folder "<strong>obmcdev</strong>" =
on Dropbox.<br><br><center><a style=3D"border-radius: 3px; font-size: 15px;=
 color: white; border: 1px #1373b5 solid; box-shadow: inset 0 1px 0 #6db3e6=
, inset 1px 0 0 #48a1e2; text-decoration: none; padding: 14px 7px 14px 7px;=
 width: 150px; max-width: 150px; font-family: proxima_nova, 'Open Sans', 'l=
ucida grande', 'Segoe UI', arial, verdana, 'lucida sans unicode', tahoma, s=
ans-serif; margin: 6px auto; display: block; background-color: #007ee6; tex=
t-align: center;" href=3D"https://www.dropbox.com/l/scl/AAAD3mrtpI0FHYKpU5S=
cL06DQmWRz7h9O_Q">Go to folder</a></center>
<br>Enjoy!<br>The Dropbox team<script type=3D"application/ld+json">{"action=
": {"url": "https&#58;&#47;&#47;www.dropbox.com&#47;scl&#47;fo&#47;gqtxgwt8=
erl9apni63pcm&#47;AACEWEtbaxlZJ19zcVLJ_dcGa&#63;dl&#61;0&#38;r&#61;AA9jEw-d=
6RZfcQUFIpCTKiv0PFxE9_DesBnl5qgzitmgJBzplTRU4FPPZxF9Dlpz11zbTZA6kqZxclUmkAr=
mhkjIKaD-oMi2J7c0pKESdcSqWQJ9i7lq9WTRatU62OGoCtyJeG7nbpxb8pdNFB6M9xMi1kHjUQ=
tcJTxxZTkmvedQemIM-9V3BFfg7gFURFVHdiFiLQOdJJajlkZ19zCutG5J&#38;sm&#61;1", "=
name": "Go to folder", "@type": "ViewAction"}, "@context": "http://schema.o=
rg", "@type": "EmailMessage", "description": null}</script>
</td>
<td width=3D"36"></td>
</tr>
<tr><td colspan=3D"3" height=3D"36"></td></tr>
</table></td></tr>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" align=3D"center" border=3D"0">
<tr><td height=3D"10"></td></tr>
<tr><td style=3D"padding: 0; border-collapse: collapse;"><table cellpadding=
=3D"0" cellspacing=3D"0" align=3D"center" border=3D"0"><tr style=3D"color: =
#a8b9c6; font-size: 11px; font-family: proxima_nova, 'Open Sans', 'Lucida G=
rande', 'Segoe UI', Arial, Verdana, 'Lucida Sans Unicode', Tahoma, 'Sans Se=
rif'; -webkit-text-size-adjust: none;">
<td width=3D"400" align=3D"left">
<a href=3D"https://www.dropbox.com/l/AAAEAVuj2H524gNZTPXUMMBzSEGjwxPh5MY/re=
port_abuse">Report to Dropbox</a><br> </td>
<td width=3D"128" align=3D"right">&#169; 2019 Dropbox</td>
</tr></table></td></tr>
</table>
</td></tr></table></center></body>
</html><img width=3D"1" src=3D"https://www.dropbox.com/l/AABG96cyQZYkpf9BVF=
GWwUm5cMzu45BbZSk" height=3D"1" />
--===============5378081814455380666==--

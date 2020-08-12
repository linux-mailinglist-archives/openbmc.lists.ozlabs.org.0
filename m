Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA822428A9
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 13:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRSBw1ctFzDqWx
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 21:28:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=ur.starklee@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PYHr3ywJ; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRNQG4M06zDqXV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 18:38:25 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id b14so1357983qkn.4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:thread-topic:thread-index:date:message-id
 :accept-language:content-language:mime-version;
 bh=vxsYKE9damgEmu/Y5Y6OCecdaMhqznXHWyaV45b+7GI=;
 b=PYHr3ywJGei8PSMbsEeSE1FpfqqzMSrPrqaduf3zfImYb1QqGbxlVtsQL24jBSWZ+b
 2AQ5RxixEDb7LsdiAgDANr6VE4FVov8p7FqgQw4LEpDZoybtp8vo3bA6IrEmnjdxHJnp
 sMXrUqzW3AL6gfxUrc+tpt49ZLu/cuyzXfugcqWI2+F6SO7bdQ9FcTeW/tu9XLk7bjAN
 GFNzY/p/UDWv1x2vYZsDD7Kfl2qqxoQmRF8yqzj1wDmFSWXMRaDRrUcw1Qo+t18RoZOu
 +IaONYrvnlkkvtud9AcDw72rd0Jrg8M3/lUOfXkqfnPuNwDBcHreMNh5G/oYPgAEHscd
 KCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:accept-language:content-language:mime-version;
 bh=vxsYKE9damgEmu/Y5Y6OCecdaMhqznXHWyaV45b+7GI=;
 b=Ox4qG1JMTsq9u/dZK8SWMe1JDsvgrzzMQAkVdAVZV9abUQRCYYeBKV8F42SayJEbTd
 EO7LNtTXhGEpKO98jXPCNUiQzQ0KUz5m0WMdHwdST5ps+x8re4kbVm6WsRd/OwvE2Qwl
 tzJ8jYF47X8HnQhndJpm4ATO+mCfhUn+b5y90lHm/shElx4LGtcUSBrZ4wRhm6fE5Zi8
 g2GViMSVRPXlynLMPvpPx/BBmLi2JasiA5KrMKu48lnKUMxAEpECPmiOeqW3IaFLeNDx
 8iz2+UkEX5G8VeCL0jSPGT4CZl8bgJpT0wn6FlgXTC59sbXwTHoz4lfIVssx6xL7Q2LW
 0ndA==
X-Gm-Message-State: AOAM533PFZLu0/wA0uDLWKL7zllLkBI3WZgImOkIbBivGv+9rKM4gjKR
 t6ms5UI2W4QZSaXjxh1nUByD667d
X-Google-Smtp-Source: ABdhPJxXzcnie5XQShZ8MV3121PgFYRVZpvuVRIgTOPI2nZZPuVsjuCOT6quuX6ONmHXqdLbAACn9w==
X-Received: by 2002:a37:a354:: with SMTP id m81mr5015707qke.277.1597221501234; 
 Wed, 12 Aug 2020 01:38:21 -0700 (PDT)
Received: from BN8PR20MB2689.namprd20.prod.outlook.com
 ([2603:1036:303:3036::5])
 by smtp.gmail.com with ESMTPSA id d16sm1528515qkk.106.2020.08.12.01.38.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Aug 2020 01:38:20 -0700 (PDT)
From: =?iso-2022-jp?B?GyRCTXsbKEIgGyRCQDFAMRsoQg==?= <ur.starklee@gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about WEBUI
Thread-Topic: Question about WEBUI
Thread-Index: AQHWcIPtRA6yz65L+U2HYN80npymaA==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 12 Aug 2020 08:38:19 +0000
Message-ID: <BN8PR20MB268985C7163EF6A03E9E47ADA7420@BN8PR20MB2689.namprd20.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/alternative;
 boundary="_000_BN8PR20MB268985C7163EF6A03E9E47ADA7420BN8PR20MB2689namp_"
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Aug 2020 21:27:30 +1000
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

--_000_BN8PR20MB268985C7163EF6A03E9E47ADA7420BN8PR20MB2689namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi,
       I am stark and a newbee for openBMC development. Our company are pla=
nning to develop a customized software to manage BMC for our template. I am=
 trying to use openBMC as framework and I have set up all required environm=
ent.
For now I have set up a system based on Ubantu 16.0.4 and download all pack=
ages. Then I successfully build an image based on Romulus and use qemu to s=
tart it. And I can open localhost:2443 to manage it. All the steps have bee=
n done as Github procedures.
But as requirement we want to customize the WebUI and I try to do as Github=
. I put phosphor-webui in build directory. And use npm start it. My npm ver=
sion is 6.14.7. But when I try to login into my image with special IP addre=
ss. It failed and show cors-xml problem and server unreachable.
After that I find original code in /home/bmc/openbmc/build/tmp/work/all-ope=
nbmc-linux/phosphor-webui/1.0+gitAUTOINC+2e1eec80de-r1/git/, and I try to c=
hange its logo picture. But it did not work. Can you give some advices how =
to do that? I can=1B$B!G=1B(Bt find some useful  tutorials.

Thanks

--_000_BN8PR20MB268985C7163EF6A03E9E47ADA7420BN8PR20MB2689namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49 \7EBF ";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Times;
	panose-1:0 0 5 0 0 0 0 2 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">Hi,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am stark and a newbee for openBMC devel=
opment. Our company are planning to develop a customized software to manage=
 BMC for our template. I am trying to use openBMC as framework and I
 have set up all required environment. <o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">For now I have set up a system based on Ubantu 16=
.0.4 and download all packages. Then I successfully build an image based on=
 Romulus and use qemu to start it. And I
 can open localhost:2443 to manage it. All the steps have been done as Gith=
ub procedures.
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">But as requirement we want to customize the WebUI=
 and I try to do as Github. I put phosphor-webui in build directory. And us=
e npm start it. My npm version is 6.14.7.
 But when I try to login into my image with special IP address. It failed a=
nd show cors-xml problem and server unreachable.
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Times">After that I find original code in /home/bmc/open=
bmc/build/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+2e1eec80=
de-r1/git/, and I try to change its logo
 picture. But it did not work. Can you give some advices how to do that? I =
can=1B$B!G=1B(Bt find some useful &nbsp;tutorials.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Times">Tha=
nks<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BN8PR20MB268985C7163EF6A03E9E47ADA7420BN8PR20MB2689namp_--

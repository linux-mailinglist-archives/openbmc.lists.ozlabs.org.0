Return-Path: <openbmc+bounces-1089-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B44CF5B20
	for <lists+openbmc@lfdr.de>; Mon, 05 Jan 2026 22:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlSRF3hnRz2xQB;
	Tue, 06 Jan 2026 08:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.152.74
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767638717;
	cv=none; b=oslzQa8NqVpVuPCEJ6ZPFn8N7BuEgm1Xpzyh1LYk8ILtKWDMsq0aTZaroTPDKcPazsaGEA7yBTeTLBrqEFLk7Aq7e1DZz3j7upuw62vRn40FK01R1xEaOIk8ku5l6bBxNwHuZasKWLjBG733RMoAb8PpuWdow4912GKfrHc25Jveh5ocajLhnHezfwd9AUYbNFEa5RG3r8Fy4TmWGS1ssSQOaY4DOoXdfuYM5jNhBIJ8Roc7QPiX1gPWsJYhTfFtqoqKH+F3oTI/g5NGnTr/vEmn9BvlIC++6wOZEfGrRMTFPjWLO4tK93Msv3S8w1DHHusSgBhfuRBKxPq78CTldA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767638717; c=relaxed/relaxed;
	bh=MbgnOUHtakK0Of5xhhfurS4ghIX+EFFAUL8QgWLVdIQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kjGpnQyF//Dg2BpXrtFe2qCtl6AlybqTJ31RfUc83ebliCBeIiym/spSC76utzKy079GmwCdM2vC5lnnPTSyqC7kKTCiCKhmgVkWJn+STUvB39fbS/2cpDKIsa/icw6eo2hbGMod7Sw1SuDv2Xs0dZ4OX5rhYRBgmMw4pTd5zY76ldU53wSEP+2E16CCmnzyAfYG3VmoaSPFi9TET+aKMSyAbw+iAIWZFLX7Q3AGRiETUGPxGlU5uMH/h4mVuPWIBiUBa2n3759WJ2It+L6CClP6qWtCNdab2pQr5mdO7NDkNBscvTC9UJJljmsWme8NkjDhykJhrLsk1AUb5sTmbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=coreweave.com; dkim=pass (2048-bit key; unprotected) header.d=coreweave.com header.i=@coreweave.com header.a=rsa-sha256 header.s=pps05102023 header.b=LK6EWaxa; dkim=pass (2048-bit key; unprotected) header.d=coreweave.com header.i=@coreweave.com header.a=rsa-sha256 header.s=google header.b=gR3bo916; dkim-atps=neutral; spf=pass (client-ip=148.163.152.74; helo=mx0b-0072dd01.pphosted.com; envelope-from=ext_jtruong@coreweave.com; receiver=lists.ozlabs.org) smtp.mailfrom=coreweave.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=coreweave.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=coreweave.com header.i=@coreweave.com header.a=rsa-sha256 header.s=pps05102023 header.b=LK6EWaxa;
	dkim=pass (2048-bit key; unprotected) header.d=coreweave.com header.i=@coreweave.com header.a=rsa-sha256 header.s=google header.b=gR3bo916;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=coreweave.com (client-ip=148.163.152.74; helo=mx0b-0072dd01.pphosted.com; envelope-from=ext_jtruong@coreweave.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 718 seconds by postgrey-1.37 at boromir; Tue, 06 Jan 2026 05:45:15 AEDT
Received: from mx0b-0072dd01.pphosted.com (mx0b-0072dd01.pphosted.com [148.163.152.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlNXC5qjBz2xm5
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 05:45:14 +1100 (AEDT)
Received: from pps.filterd (m0355331.ppops.net [127.0.0.1])
	by mx0b-0072dd01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605HJQh73083876
	for <openbmc@lists.ozlabs.org>; Mon, 5 Jan 2026 18:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=coreweave.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	pps05102023; bh=MbgnOUHtakK0Of5xhhfurS4ghIX+EFFAUL8QgWLVdIQ=; b=
	LK6EWaxaMIDyOEHPzGqVHRaXZJEq9AJoIkAq16IEjvpdaJKLlcFyjwGpGKNWOL0c
	h/1aj6xBrteYxpUvAJXNaIA1+MzOA1RlslvWlDhokw0k9SB6/HqD9x8isJlfq67F
	QVGV0Crth4KypDEpnMs+n80oRjn7AardcVHA/eKy9meWarGrNS1YOvnGwywYf7gt
	w01nuiexnNtSPIs0nUy95Os1MJK3co/jbcRwcZJTJa46syRXIGXRcNlttHfJiaJZ
	OmFcdbH+THIMtGxLxulkQf8AqgfZDVuOWdGIZWE3i7M8T/RWW8AtMeb+0BY2+Z7Z
	pphdTmuDB8fNR1y693oQaQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0b-0072dd01.pphosted.com (PPS) with ESMTPS id 4bfdkh20yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 05 Jan 2026 18:33:11 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7881cff41b7so4201957b3.2
        for <openbmc@lists.ozlabs.org>; Mon, 05 Jan 2026 10:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=coreweave.com; s=google; t=1767637991; x=1768242791; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MbgnOUHtakK0Of5xhhfurS4ghIX+EFFAUL8QgWLVdIQ=;
        b=gR3bo916bPXtJm2JtzOcGVc8kluCSp2VM+QuWHc+zPikr4SA/KSwHqQNWOg5PpmSBl
         RznWJTViOREeILvz8qQOjIT3BvXNcG2K8SIKuC4dCqyChw6i9qa33aOkLw89cQJ5GM0b
         mK4pi3WvCRzfO2ceZEMrFVh8CP7BuADdP3KCqf7SN7mUe6eNWEH+bOXM9K2dNUv7jVs7
         kUptej47KKpdSYIZh7ZrD6cRFNG/45hNXolCgXbtI7pBy3OTNIb3ciVCT0e1eZJC62RR
         L8DyHddUpVDcAiy0mWU5xgnNly6LB8dC6yHKMyTyCQIY7K0dJWa4pxqeNT3Inut4EFZB
         C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767637991; x=1768242791;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbgnOUHtakK0Of5xhhfurS4ghIX+EFFAUL8QgWLVdIQ=;
        b=Yo9UsMClDDGGpJIOz1CC6Rd9oObJh5F9Aodsk7DDpmKku0ZtY2cPcsPZTuqbR9tY7T
         MdonnnhxYqMxSabKFvijbN3Fsb/eN2svNtn95mdJ13yJ5Y7KPaKXF8TM2E9oT+QYj5e7
         vBks57pXpvwrE5f9jt1uDPYtP15EICbahivw68iSZK1LGNZrn1DwfHJ1drQf27eSI7ub
         1rE0k7ytFoBzP0Ec4tyN89aPynCZgqr33g9kaWs1Z6yhrFP/niFP1KPokLPqf+FGQKj7
         UwWRnwnCDJc4wS55bfO/SG26V6Cmpnb9P3REtjSdVPgQSwSC9JrzeJm45btpjVv8Ivid
         uTcg==
X-Gm-Message-State: AOJu0Yz+tQgmmnrnESAX8IPUx8jTVTbU52ALnYVFzjORq//7u7wpu2vf
	4fyyy9ApsDZ71NDVdt9kxQWaLKUApYonFlxlY68ceeZLNIk/FHg9Xe7TW+zkpuM3LrLOqwITz7b
	tLSHNi2bqmiL19xL1tTXMR7E6a+wad5dU0EM+g3Snf9Lw7oKxGsr32uJP6gFZcqZdhrwN2bcTrB
	ZA/6141/6qkA2bRxZpygeeKI7ojGTXKkk9aallIk2w77hSS9o=
X-Gm-Gg: AY/fxX5xo27nBl2QMrRmjkFMyTVQdt6SiIEfxAFFrLwALRP3kLe5l5RMkRwNrtjnA7r
	Y6D3yJtkbG0wLKIFGPoLORXnAJsdSyvzCUBDj5m98V92q4ViGTrfAeihJGNOoeiY0YL9+h0HSgl
	bzE1y5mw8Ypto2NTD2dblKnW5nf0LIHi74+fwhDxnYiMELjuzTFpgiokyHXKkW3apmIpPT
X-Received: by 2002:a05:690c:c451:b0:784:8153:c61a with SMTP id 00721157ae682-790a8ae072bmr4509187b3.34.1767637991136;
        Mon, 05 Jan 2026 10:33:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESfQnd9xMSXyx1Lw0Z/wdWpnCAsTe4rbzOnxtX4Ke06h512ym5BRNAu0ETGFXLcIkvlti7ArbJWvuMFIOFRnw=
X-Received: by 2002:a05:690c:c451:b0:784:8153:c61a with SMTP id
 00721157ae682-790a8ae072bmr4509067b3.34.1767637990580; Mon, 05 Jan 2026
 10:33:10 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Judy Truong <ext_jtruong@coreweave.com>
Date: Mon, 5 Jan 2026 10:32:55 -0800
X-Gm-Features: AQt7F2oGgOWX62Qi8_mrJ6mzvK0ExbIbUVQ3AcRxsiPW7WrFaoFtvpQKY7gs188
Message-ID: <CAKRF4E5NM5Zkh6UijWQVS1PtSQwKr8ttPk=-RasBh1V2oJBe9A@mail.gmail.com>
Subject: =?UTF-8?Q?=F0=9F=9A=80_We=E2=80=99re_Hiring=3A_Firmware_Engineers_=28Mid_to_Seni?=
	=?UTF-8?Q?or_Levels=29_=40_CoreWeave?=
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008535ba0647a84ace"
X-Proofpoint-ORIG-GUID: ud2Wqg6SbQPT8EfvLtbzPq2y3icoIrrY
X-Proofpoint-GUID: ud2Wqg6SbQPT8EfvLtbzPq2y3icoIrrY
X-Authority-Analysis: v=2.4 cv=YY+wJgRf c=1 sm=1 tr=0 ts=695c03e7 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=vUbySO9Y5rIA:10 a=5KLPUuaC_9wA:10
 a=l-fz8MELSNkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=59x7OiLhAAAA:8
 a=5CRca_UmfOXlflA8JWMA:9 a=QEXdDO2ut3YA:10 a=itSJYf9FAAAA:8
 a=kmbGXolErplFgTUaSAoA:9 a=BaFHy3l2QECDViLX:21 a=lqcHg5cX4UMA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=r0nIxo0k5eNsyZar2h_5:22 a=BSB95dMbIMw5xNolKfBJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE2MSBTYWx0ZWRfX1IVeOhD4EipI
 Y6yAicTd9flOckD4XSwUBYI9sH8QRE04YotuRRIjMa25B/qClCNqqqND4FOu/wcXIj1ZFhjN30b
 VjwUNzJjtehqQxRYnDQ4xIjRvT1C1Knh4nRxn6sCHIsTweDaP+2K0DIVqh+BCGPnZ/O2KZlDU8v
 sNZwRXvJ7SbKwqeb3U5A1GscFBJBLDvKRQXmMKP3B/XCvP1pSqGAtGVJEd2yGa+eGozmnfLeZc2
 Jx1P94ygJznoxIv7pWJ0LjhlZ0wD4CytH82tcyrNjMERCuHwJs7u97inxhXvIUeBsLbzsL5BpMW
 BtidqDvtRf6YLJJmRwYcJ7POBZtg7m/xiCR252deIECGCL8dQ64G0LJSyKFD5/LW7+FhTnaMT8V
 bhWJMUDzrrxbdb+90CLVmcd7y9OjAqXI41E4Dhk5cayLIujtlozc8x/sgMuBM9a+eRUKwfjWzRI
 KaK7APflp84ID3gE2AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000008535ba0647a84ace
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Happy New Year everyone-


CoreWeave <https://www.coreweave.com/> is expanding our firmware team to
scale the world=E2=80=99s most advanced AI cloud. We have multiple openings=
 ranging
from *Mid-level (3+ yrs)* to *Senior (8+ yrs)* across several of our hub
locations.


=F0=9F=93=8D* Locations:* NYC | Livingston, NJ | Bellevue, WA | Sunnyvale, =
CA  ***listed
in order of preference*


*The Roles:*

   - *Mid-Level:* Great for those with ~3 years of experience looking to
   grow into a key technical contributor within OpenBMC and AMI environment=
s.
   - *Senior-Level:* Seeking 8+ years of experience to lead projects,
   mentor junior engineers, and drive innovation in our Redfish API and BMC
   stacks.


*Technical Core:*

   - Strong *C/C++* for embedded systems.
   - Hands-on with *OpenBMC*, AMI MegaRAC, or SPX.
   - Familiarity with Linux, Git, and hardware interfaces (I2C, SPI, UART).


*Why CoreWeave?* Since our 2025 IPO (Nasdaq: CRWV), we=E2=80=99ve been movi=
ng
faster than ever. You=E2=80=99ll be building the actual infrastructure that=
 powers
global AI breakthroughs.

*Know someone?* If you aren't the right fit but know a firmware pro
who is, *please
forward this to them!*


Apply Here: Firmware Engineer,
<https://coreweave.com/careers/job?4615564006&board=3Dcoreweave&gh_jid=3D46=
15564006>
Senior
Firmware Engineer
<https://coreweave.com/careers/job?gh_jid=3D4452431006&board=3Dcoreweave>

--=20

Judy Truong | Senior Technical Recruiter

ext_jtruong@coreweave.com <sgee@coreweave.com>
www.coreweave.com

--0000000000008535ba0647a84ace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Happy=
 New Year everyone-=C2=A0</p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;font-size-adjust:none;font-kerning:auto;font-feature-settings:no=
rmal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quo=
t;Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;font-size-adjust:none;font-kerning:auto;font-feature-settings=
:normal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&=
quot;Helvetica Neue&quot;"><span class=3D"gmail-s1" style=3D"text-decoratio=
n-line:underline"><a href=3D"https://www.coreweave.com/">CoreWeave</a></spa=
n> is expanding our firmware team to scale the world=E2=80=99s most advance=
d AI cloud. We have multiple openings ranging from <b>Mid-level (3+ yrs)</b=
> to <b>Senior (8+ yrs)</b> across several of our hub locations.</p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;font-size-adjust:none;fon=
t-kerning:auto;font-feature-settings:normal;font-stretch:normal;font-size:1=
3px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">=F0=
=9F=93=8D<b> Locations:</b> NYC | Livingston, NJ | Bellevue, WA | Sunnyvale=
, CA<span class=3D"gmail-Apple-converted-space">=C2=A0 </span><i>**listed i=
n order of preference</i></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;min-he=
ight:16px"><b></b><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>Th=
e Roles:</b><b></b></p>
<ul class=3D"gmail-ul1">
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>=
Mid-Level:</b> Great for those with ~3 years of experience looking to grow =
into a key technical contributor within OpenBMC and AMI environments.</li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>=
Senior-Level:</b> Seeking 8+ years of experience to lead projects, mentor j=
unior engineers, and drive innovation in our Redfish API and BMC stacks.</l=
i>
</ul>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;min-he=
ight:16px"><b></b><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>Te=
chnical Core:</b><b></b></p>
<ul class=3D"gmail-ul1">
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Str=
ong <b>C/C++</b> for embedded systems.</li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Han=
ds-on with <b>OpenBMC</b>, AMI MegaRAC, or SPX.</li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Fam=
iliarity with Linux, Git, and hardware interfaces (I2C, SPI, UART).</li>
</ul>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;min-he=
ight:16px"><b></b><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>Wh=
y CoreWeave?</b> Since our 2025 IPO (Nasdaq: CRWV), we=E2=80=99ve been movi=
ng faster than ever. You=E2=80=99ll be building the actual infrastructure t=
hat powers global AI breakthroughs.</p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-size-adjust:n=
one;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font=
-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><b>Kn=
ow someone?</b> If you aren&#39;t the right fit but know a firmware pro who=
 is, <b>please forward this to them!</b>=C2=A0</p><p class=3D"gmail-p1" sty=
le=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;font-size-adjust:none;font-kerning:auto;fon=
t-feature-settings:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal;font-family:&quot;Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" =
style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;font-size-adjust:none;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;line-height:normal"><font =
face=3D"georgia, serif" style=3D"" size=3D"4">Apply Here: <a href=3D"https:=
//coreweave.com/careers/job?4615564006&amp;board=3Dcoreweave&amp;gh_jid=3D4=
615564006" style=3D"">Firmware Engineer,</a> <a href=3D"https://coreweave.c=
om/careers/job?gh_jid=3D4452431006&amp;board=3Dcoreweave" style=3D"">Senior=
 Firmware Engineer</a></font></p></div><div><br></div><span class=3D"gmail_=
signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D=
"color:rgb(136,136,136);line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;vertical-align:baseline"><span style=3D"border:none;display:inline-bloc=
k;overflow:hidden;width:112px;height:75px"><font size=3D"1"><img src=3D"htt=
ps://lh5.googleusercontent.com/Y-ahxaMl-0xzC4ikwQIOtbdWNAjxVHVf6NxSD27TAhpH=
O0MkiLy6r1ru7f4V-e759JHUNvdo06J2Ox3yo5itEyIbTpWk2U4Jfv3mJI6X8W1I4Qo2o80ds63=
O1vxqk4kQ4boKYNm_ILcZvOzMnUxFffs" width=3D"112" height=3D"75" style=3D"marg=
in-left:0px;margin-top:0px"></font></span></span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><font size=3D"1"><sp=
an style=3D"font-family:Arial;background-color:transparent;font-weight:700;=
vertical-align:baseline"><font color=3D"#666666">Judy Truong</font></span><=
span style=3D"color:rgb(0,0,0);font-family:Arial;background-color:transpare=
nt;font-weight:700;vertical-align:baseline"> </span><font color=3D"#444444"=
><span style=3D"font-family:Arial;background-color:transparent;font-weight:=
700;vertical-align:baseline">|=C2=A0</span><span style=3D"font-family:Arial=
;background-color:transparent;vertical-align:baseline">Senior Technical Rec=
ruiter</span></font></font></p><p dir=3D"ltr" style=3D"color:rgb(136,136,13=
6);line-height:1.44;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-f=
amily:Arial;color:rgb(17,85,204);background-color:transparent;vertical-alig=
n:baseline"><a href=3D"mailto:sgee@coreweave.com" style=3D"color:rgb(17,85,=
204)" target=3D"_blank"><font size=3D"1">ext_jtruong@coreweave.com</font></=
a></span></p><a href=3D"http://www.coreweave.com/" style=3D"color:rgb(17,85=
,204)" target=3D"_blank"><span style=3D"font-family:Arial;background-color:=
transparent;vertical-align:baseline"><font size=3D"1">www.coreweave.com</fo=
nt></span></a></div></div></div>

--0000000000008535ba0647a84ace--


Return-Path: <openbmc+bounces-21-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EEAA0B69
	for <lists+openbmc@lfdr.de>; Tue, 29 Apr 2025 14:21:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zmzv92gdNz30HB;
	Tue, 29 Apr 2025 22:21:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.251.60.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745929285;
	cv=none; b=gdXR2nB5yyzsIwrSZbi12//UNxyi+qUKO4TKfOE66PYUlZxwUvnND8JoFoCZ1vziQURpSlZufIXl3JCFJmhwoecjXbCU1jmOCzq5i/8dVZeQ3uCTEFU81A6ZiOuwRAj+odFBEm9ue3DlXWrah6n7lz5aQu8VxmB5C1/qtfMuB11SV38ddgEjVe2wkPCUxvgMemNgCdl4lvrGFIUNIEbS5cS/N4dlI8J8EJ9cz2iE9+81+vibev0UYLKrvY1/eZAktOdgjk2xUWiXoYlAcSCmpEWhn+4MZQWvZHl7dBv538gsmKh2hYaVKfzEQiezcJ+y52ZjYNV0CaCHuY2Q2G8QoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745929285; c=relaxed/relaxed;
	bh=OUf4SESvdXswHu6YyllK9rkoe9uCHBInskYTpg88Eb0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oh9WnYXsGBSkZ3BkKU+cvzmimSXFfp/f1vV3249L3udIr3CbiDdu3fhU81xOufQuJDXF2tw8tStpSfv1msfXdCzPxZRKSV2TV0txLqE3lN8MaHy0rX74lrauxcEVLX0zSDuSiT0x0uWKLko93KJfHiGt3nsu6N9ffJdiBIqLDR2dEO6CXUTOEDKCXMXeofNGqOfjfds3Hh7Xfc51REnvkYzN2Rbv2WklMcdpJXsRm056a49Pb6m22/7vkSlR5+PIJ/k+1xuU0YK1xVmJQvF4SJ7gMFA3sNNIwea8DXDCsOz7IKG6Yw1U/ZP42qXzIb8sPq6smVtcbc0GkgMQXwKwlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com; dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=f4tjjCDD; dkim-atps=neutral; spf=pass (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=207987a0c=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org) smtp.mailfrom=asrockrack.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=f4tjjCDD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asrockrack.com (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=207987a0c=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 29 Apr 2025 22:21:21 AEST
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zmzv56WNsz2yfK
	for <openbmc@lists.ozlabs.org>; Tue, 29 Apr 2025 22:21:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asrockrack.com; i=@asrockrack.com; q=dns/txt;
  s=asrockrack; t=1745929282; x=1777465282;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=OUf4SESvdXswHu6YyllK9rkoe9uCHBInskYTpg88Eb0=;
  b=f4tjjCDDYiXI59wocdRZZQTYYtMLwbDK5oSMhf/EGsESRPN9vrXhwsDt
   LgxbzGdae4CoSFrRZfLLjeVnWw7w5qvG9qJe1K/jEROJI619jUEBOKfEW
   UVYlTF5dk/Ys+NO4yUb1kdjtFu5wonHwGo2OXJe99uWAr7aOIakRsfo9X
   XxDeQVW7pVQRKUD/UfzNQudBYIFkkmyXahgdLAU/vSK9anG6glAzXqfDH
   a6HqsiJenwOfy2vUplOG3ZkEebEinrZLaERhy1zEYTV0K0lXFRh22MxM4
   J+ZK4q7lb8StYhFYoJTYQTZvF8WGkf/hSg6/Ce1DNhS+xUnxklhzJpnKe
   A==;
Authentication-Results: ms.pegatroncorp.com; spf=SoftFail smtp.mailfrom=Jeff9_Chan@asrockrack.com; spf=None smtp.helo=postmaster@PTW-MSE-AP02.pegatroncorp.com
Received-SPF: SoftFail (ms.pegatroncorp.com: domain of
  Jeff9_Chan@asrockrack.com is inclined to not designate
  172.18.192.78 as permitted sender) identity=mailfrom;
  client-ip=172.18.192.78; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="Jeff9_Chan@asrockrack.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  include:sendersrv.com ip4:58.240.231.120/30 ip4:124.9.5.0/26
  ip4:43.251.60.0/22 ip4:192.72.126.0/24 ip4:58.211.157.0/30
  ip4:221.224.25.136/30 ip4:210.80.80.195 ~all"
Received-SPF: None (ms.pegatroncorp.com: no sender authenticity
  information available from domain of
  postmaster@PTW-MSE-AP02.pegatroncorp.com) identity=helo;
  client-ip=172.18.192.78; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="postmaster@PTW-MSE-AP02.pegatroncorp.com";
  x-conformance=spf_only
Received: from unknown (HELO PTW-MSE-AP02.pegatroncorp.com) ([172.18.192.78])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 20:18:14 +0800
Received: from ASR-EX-MBSC02.asrock.corpnet ([172.18.50.39])
	by PTW-MSE-AP02.pegatroncorp.com with ESMTP id 53TCICZG050106;
	Tue, 29 Apr 2025 20:18:12 +0800 (+08)
	(envelope-from Jeff9_Chan@asrockrack.com)
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBSC02.asrock.corpnet (172.18.50.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 29 Apr 2025 20:18:11 +0800
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBS02.asrock.corpnet (172.18.50.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Apr 2025 20:18:11 +0800
Received: from ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797]) by
 ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797%5]) with mapi id
 15.01.2507.039; Tue, 29 Apr 2025 20:18:11 +0800
From: =?iso-2022-jp?B?SmVmZjkgQ2hhbigbJEJERD4+US0bKEJfQVNSb2NrUmFjayk=?=
	<Jeff9_Chan@asrockrack.com>
To: "tan.siewert@hetzner.com" <tan.siewert@hetzner.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: firmware update from webui
Thread-Topic: firmware update from webui
Thread-Index: Aduyriod5KZi7No4Qtmt2F5qRi2PdgGAMOiAABR2H4Q=
Date: Tue, 29 Apr 2025 12:18:11 +0000
Message-ID: <TY3PR01MB118512FD694CF79F2856B2A6CF5802@TY3PR01MB11851.jpnprd01.prod.outlook.com>
References: <eade5f77d869481f9a2992f593f92e94@asrockrack.com>,<2a78bfe6-ac76-4cfe-9de4-fe70aad07a10@hetzner.com>
In-Reply-To: <2a78bfe6-ac76-4cfe-9de4-fe70aad07a10@hetzner.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB118512FD694CF79F2856B2A6CF5802TY3PR01MB11851jp_"
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
X-MAIL:PTW-MSE-AP02.pegatroncorp.com 53TCICZG050106
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_TY3PR01MB118512FD694CF79F2856B2A6CF5802TY3PR01MB11851jp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Thanks Tan, I got it resolved by changing software-update-dbus-interface se=
tting.

Jeff

________________________________
=1B$B4s7o<T=1B(B: tan.siewert@hetzner.com <tan.siewert@hetzner.com>
=1B$B4s7oF|4|=1B(B: =1B$B@14|Fs=1B(B, 4=1B$B7n=1B(B 29, 2025 11:32:33 =1B$B=
>e8a=1B(B
=1B$BZ@7o<T=1B(B: Jeff9 Chan(=1B$BDD>>Q-=1B(B_ASRockRack) <Jeff9_Chan@asroc=
krack.com>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
=1B$B<g;]=1B(B: Re: firmware update from webui

On 21.04.25 13:20, Jeff9 Chan(=1B$BDD>>Q-=1B(B_ASRockRack) wrote:
> With latest openbmc from repo, the firmware update function in webui fail=
ed with =1B$B!H=1B(BError starting firmware update=1B$B!I=1B(B, but with cu=
rl to /redfish/v1/UpdateService actually works, is it a known issue?
Could you please check the Dev Tools of your browser to get the response
body? Also, what is the tarball purpose (BMC or BIOS)?

The web ui uses the UpdateService in the background too and at least I
couldn't reproduce it using openbmc/openbmc commit 00521301f9.

Cheers,
Tan


--_000_TY3PR01MB118512FD694CF79F2856B2A6CF5802TY3PR01MB11851jp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Thanks Tan, I got it resolved by changing <span style=3D"color: rgb(0, 0, 0=
);">software-update-dbus-interface setting.</span></div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"auto"><br>
</div>
<div style=3D"font-family:Aptos, Aptos_MSFontService, -apple-system, Roboto=
, Arial, Helvetica, sans-serif;font-size:12pt" dir=3D"auto" id=3D"ms-outloo=
k-mobile-signature">
Jeff</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;" dir=3D"auto"><b>=1B$B4=
s7o<T=1B(B:</b>&nbsp;tan.siewert@hetzner.com &lt;tan.siewert@hetzner.com&gt=
;<br>
<b>=1B$B4s7oF|4|=1B(B:</b>&nbsp;=1B$B@14|Fs=1B(B, 4=1B$B7n=1B(B 29, 2025 11=
:32:33 =1B$B>e8a=1B(B<br>
<b>=1B$BZ@7o<T=1B(B:</b>&nbsp;Jeff9 Chan(=1B$BDD>>Q-=1B(B_ASRockRack) &lt;J=
eff9_Chan@asrockrack.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.oz=
labs.org&gt;<br>
<b>=1B$B<g;]=1B(B:</b>&nbsp;Re: firmware update from webui<br>
</div>
<br>
On 21.04.25 13:20, Jeff9 Chan(=1B$BDD>>Q-=1B(B_ASRockRack) wrote:<br>
&gt; With latest openbmc from repo, the firmware update function in webui f=
ailed with =1B$B!H=1B(BError starting firmware update=1B$B!I=1B(B, but with=
 curl to /redfish/v1/UpdateService actually works, is it a known issue?<br>
Could you please check the Dev Tools of your browser to get the response<br=
>
body? Also, what is the tarball purpose (BMC or BIOS)?<br>
<br>
The web ui uses the UpdateService in the background too and at least I<br>
couldn't reproduce it using openbmc/openbmc commit 00521301f9.<br>
<br>
Cheers,<br>
Tan<br>
<br>
</div>
</body>
</html>

--_000_TY3PR01MB118512FD694CF79F2856B2A6CF5802TY3PR01MB11851jp_--


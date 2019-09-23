Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 354BCBB0F6
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 11:08:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cJQ75s1tzDqLk
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 19:08:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.10.107; helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="fQzfPK0f"; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010107.outbound.protection.outlook.com [40.92.10.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cJPL67XLzDqLT
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 19:07:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqF3oedbeCIPuLkleeLLPccmWzUz5kiGhJyLo3tIe7VjFpS8nc11Gt6PM98SEh9GQSEIUB+2jOovDgtsD9SiR8nV6bbG/9YUqbsr5s6Pj7AMyEZ68tkj2p/0HWgdsOcFdZN/8JNrQF34MvAjq6Ohuy10lDq3QXoSPFH/7YD9UCF8AtCQwY21mUkBvTZnEr1hsfcTt7FuXcm0UZo24LjKj1AGL7i85fqEv3sy7MUwi/fjlI8eoci3k/aYbusPy/7c491SJyFclfhgqWLhvQUn7sPKfMXvMXAY15XPaDeX6w8zUM5wY7JQoNAb3D1PqoPBY6u8jvL79tDMQWPCTT/4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcRFG6DI8DXfCJp8amTUZWiZ4ZBW/rwwpFJU+VkD3pY=;
 b=LQA3ogDb/3NSLVZKe8+O/AX0bK4PaKJoiKDzyl1XCAwNbhO+j9Wuz/A372ZHGsse3Kmkx6+m7pu6qAhTZL1y1ZhsRqXEdXVrVWaXhlQ7k1hSH8N8B8tRcsrx69YriaxqBaRtp5wI0Lv5xlAP2WmHAnmjfMKVg+382JMX4qDxSwRy5/kUty5cVG6yK1KDHKQrOKLLArhxSUckHwMvyvxHXRhPQUidVQU+ri4uZtK7ogUvPrj5VHaPbBODgLevjWFOR6gZu8AK4sLa/Y2pkmTY/KHauSYaRNMPprdab2u+CXQlYuiijFL24tQHdDE4pQQ3jpusGAb4hs/wGBV8OmYHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcRFG6DI8DXfCJp8amTUZWiZ4ZBW/rwwpFJU+VkD3pY=;
 b=fQzfPK0fO/a8IZxyUgvSRG1yaaIfsOljw5OPTcd/BslFEe8VePBYc1OLWoYJi68wsESdDK/viDm7r+MF0lF67RaIKSlW8V3u2r6JubgUHGAL7pWFlo2EC27umU3NDk/0M52FiBClc8MRW6iRlFLpt+QdgHYUEgi4U9CD9wiaf8SQZqUG9fp6fhk95Nv5B2wi2wt3AIwQ7RPBMXizKmxEaM9oZjqAIEpNsZPg/nUGChRzoZd6q75UKlDDHnwOoc8AUU4gQIcx6+jW0lGMTnE+cfJ6lgr63jBb9RmX+dsvkqGC+5aHgQPo5rVlNLjWcdga50VUaOsoksBjWrv2+DpUpQ==
Received: from BN3NAM04FT033.eop-NAM04.prod.protection.outlook.com
 (10.152.92.56) by BN3NAM04HT239.eop-NAM04.prod.protection.outlook.com
 (10.152.92.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 09:07:27 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.92.53) by
 BN3NAM04FT033.mail.protection.outlook.com (10.152.92.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25 via Frontend Transport; Mon, 23 Sep 2019 09:07:27 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:07:27 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: How to use apt get vim in CROPS
Thread-Topic: How to use apt get vim in CROPS
Thread-Index: AQHVce4pGRWBVnEnpkGXttHOirVM1g==
Date: Mon, 23 Sep 2019 09:07:27 +0000
Message-ID: <MN2PR04MB6669C1E57F106050BBCB3AE8CD850@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:9DE98EFFE465307E5968AB8CA3F611D88CE25D34E4E0183BE8A8F04829C7308E;
 UpperCasedChecksum:3C3A00540DB6659232928BB7C46BCF064D89FB3C9E03DAFBB4B95469DADD2FEC;
 SizeAsReceived:6580; Count:41
x-tmn: [nRSN8fh12wbPgYsjBXLEWOR+u3445/1/]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119205)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(2017031321001)(1601125500)(1603101475)(1701031045);
 SRVR:BN3NAM04HT239; 
x-ms-traffictypediagnostic: BN3NAM04HT239:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: QtN+fKxz75iC2Mn+xoIHbrWE9zdHYtGjor8TjLhBQFickGaHxnzkGI1KJhyd22iKfERLGvZt3p++XWVt/ZUqQ/jNGm9EfcaKcwxDLRVfDbj8cPFJT5pqlcFoehLF3Z9V41N70HoTodutZxJmHIcpf7idzFL2Di/8g3UA7+ymK82k0Dqv0Y7In2JN0puYXbDZ
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB6669C1E57F106050BBCB3AE8CD850MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2446ff91-d2a0-4032-2da9-08d74005750f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:07:27.7916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT239
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

--_000_MN2PR04MB6669C1E57F106050BBCB3AE8CD850MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, all,
I tried to use the CROPS to build OBMC, by the instructions at this link.
https://github.com/crops/docker-win-mac-docs/wiki/Windows-Instructions-%28D=
ocker-Toolbox%29

I get the crops/poky and the OBMC can be built successfully.

But I found I can not use vi (or vim) in the crops/poky. I tried apt get, b=
ut it needs password to get the root privilige.

What can I do next?

Zheng


--_000_MN2PR04MB6669C1E57F106050BBCB3AE8CD850MN2PR04MB6669namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi, all,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I tried to use the CROPS to build OBMC, by the instructions at this link.</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<a href=3D"https://github.com/crops/docker-win-mac-docs/wiki/Windows-Instru=
ctions-%28Docker-Toolbox%29" id=3D"LPNoLP955852">https://github.com/crops/d=
ocker-win-mac-docs/wiki/Windows-Instructions-%28Docker-Toolbox%29</a></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I get the crops/poky and the OBMC can be built successfully.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
But I found I can not use vi (or vim) in the crops/poky. I tried apt get, b=
ut it needs password to get the root privilige.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
What can I do next?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Zheng<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MN2PR04MB6669C1E57F106050BBCB3AE8CD850MN2PR04MB6669namp_--

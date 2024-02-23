Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBB8684AD
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 00:44:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=Ep62tahj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkHJG3VyHz3d2g
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 10:43:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=Ep62tahj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=7760630c0=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgvZ32JRhz3dWH;
	Fri, 23 Feb 2024 13:47:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1708656459; x=1740192459;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D8WwjuaPi+kjyV+8l1A8gslVREr4DkssfWMi3s50K1k=;
  b=Ep62tahjzAIvAf8Pf2cXTsgroEjygM8MLlLmri6F8AeiDlfE3eFq0fhX
   4QlfNS0HViNP9VFalcex6ZuHiIehDMQ9vW26vZUxB0AZgxBxCcTZs9fNt
   UJN9GdPwg4m0D6EmXNDVyMud6dsYk4s+J8AlMmQTFkrJE7L4fPFm5OYQK
   M=;
X-IPAS-Result: =?us-ascii?q?A2GhAwCxBthl/xEvFqxaHgEBCxIMggQLgjl6gWGEU5FmA?=
 =?us-ascii?q?4tfkFEqgUCBYQkPAQEBAQEBAQEBBwEBLhYEAQGFBgIWh1knNwYOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQgBAQEFAQEBAQEBBgQBAQECgRmFL0qCXAGDdgEBAQECAQELK?=
 =?us-ascii?q?EUMBAIBBgIRBAEBAQQZDwICHgcKHQgCBAENBQiFJAMOI5UumzptD4EwgQGCF?=
 =?us-ascii?q?gSwHw2CVQkBgQc3iAgeAYNCgi2DQXuCTyZvQoJoPoIfgW8BEgEjBRAhAoMYQ?=
 =?us-ascii?q?oIvBIETf4M7gzCBKIxegRKBIYcAVH8cA4EFBFoNBRYQHjcREBMNAwhuHQIxO?=
 =?us-ascii?q?gMFAwQyChIMCx8FVANABkkLAwIaBQMDBIEwBQ0aAhAaBgwmAwMSSQIQFAM4A?=
 =?us-ascii?q?wMGAwoxMFVBDFADZx8WHAk8DwwaAhsbDSQjAixAAwkKEAIWAx0WBDARCQsmA?=
 =?us-ascii?q?yoGNgISDAYGBl0jFgkEJQMIBANUAyF0EQMECgMTBwsHeIIJgT0EE0cQgTSKJ?=
 =?us-ascii?q?gyCRANEHUADC209NRQbBQQfAYEZBaA5E2lAEBADERoUCGgrFVARLo9Sc4JAg?=
 =?us-ascii?q?z+uQ3ANgwuBA4oLjyWBe4YrF4QFjHqZJphZIJFPlmACBAIEBQIOCIFBOYEQc?=
 =?us-ascii?q?DM9gzdSGQ+iE3g7AgcBCgEBAwmCO4YzBS9nXwEB?=
IronPort-PHdr: A9a23:AykIwByKB57km+nXCzLLzFBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 h2Zvqgm0AGBHd2Cra4e26yO6+GocFdDyKjCmUhBSqAEbwUCh8QSkl5oK+++Imq/EsTXaTcnF
 t9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFRrlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+M
 hG7oR/fu8QWjodvJac8wQbNrndUZuha32xlKUyQkhrm+su84Jtv+DlMtvw88MJNTar1c6MkQ
 LJCCzgoL34779DxuxnZSguP6HocUmEInRdNHgPI8hL0UIrvvyXjruZy1zWUMsPwTbAvRDSt9
 LxrRwPyiCcGLDE27mfagdFtga1BoRKhoxt/w5PIYIyQKfFzcL/Rcc8cSGFcRctaSTBPDZ2gY
 IsOF+oBPPhXr4/hp1sVsBCyARCgCP7zxjNUg3P727Ax3eY8HgHcxAEuH8wAvWrJotXpOqkcU
 u61w6vUwjvMYPxbwiv955PUfhw9vf2AQbFwfMzMwkcvDQPFiVCQpJTgMTyL0uQNt2ia5PdiW
 +KyjW4npAV9oD6pxMUqj4XCm4UYxFXa+iV9xIY0JcW3RkxmYd6iH5tdrDuVN5BrQsM5WW1np
 CE6yrgftJO9YSMFx4gpyQTFZPybb4iH/AjjVOCJLDl2mH5pZK6yiwu9/Eav1ODyVsu53VVUo
 iRLltTBqm0B2wLP5sWEV/Zw4Eiv1DiB2Q7T6OxJPU45mbbbJZMvzbM9kIcYv0fbHiLuhUn7j
 rGael869uS28ejqbbfrqoWBO4J2kg3yLKUjltCxDOk9LwQCQ2yW9OW52bDs4UH1XLBHguM1n
 6bEtZ3XINkXq6C/DgRIzIsj7wu/Dyy60NsGh3kJMVNFeROZgIXxJ13DJu3zA+2ljFS2ijhrw
 ujLPrjmAprQMHfOiKzhfbNh605Ezwoz0Mxf64pUCr4fJPLzXVf8usLCABMgNAK6zf/rB9ph2
 o8DQ26AHqiZMLnKsV+O+O0vP/OAa5UOuDbgMPgp///ujXknll8BZaSlwJkaZG6iEvh4PUmVe
 3Xhj9UbHWsXvAcyVOnqh0eDUT5XaXayRaU85jQjBYyjE4jDQoStgbyZ0ym5A51WYG9GB0uWH
 nfzaoWEQO0AZz6VIs9kijAEU6OuRJc71R6yrA/616ZnLu3M9yEFq57vzMJ16PHLlREu6Tx0C
 NyQ3H2KT2FymWMIXSQ73KNhrkxnzFeMz6x4j+ZfFdxJ6PNFSh06OoLEz+xmF9DyXRrMfs+RS
 FanTdWmATYxTs8qw9AQeEt9FNCigQrC3yquGbMai7uLBJks/qLGw3fxP9p9y2rB1KQ5lVkmR
 dBANW2hiqFi6wjeHI3JnFuDl6asa6sc2DTB9GCZzWqBpE1YShJ/Ub3ZXXADYUvbtdf55lnDT
 r6uErQmMxdBycmMKqdQad3pilRHRPPkONXQeGKxmGawCRGVybOQd4fqf2Qd3CPHB0gelAAf5
 3GGNRIxBiu5uWLRECRuFU7zY0Pr6eRxtHS7TkkzzwGQaEFuyqa19wUWhfOCUfMT2KwLuCM7p
 zVzBla90IGeN93VjA1ne78UTdQ65FpWnTbSsAp6JLSjIrpki1pYdB546Qem9BhzDpQIsdUso
 zt+1BJzJqKfzUhMXzyd1JH0fLbQLz+h0gqobvv111XawZ6256EAqAzAUxSr6CKkEk4zxFV61
 dZ92mCB/dPBCw9EAsG5aVo+6xUv/+KSWSI6/Y6BkCQ0acFc+hfO2NMsUe0izBvoP9JSK7iNG
 wK6FcoGT9OvJ+onlxnMDFoEMele+bRyM5agcP2Li6KuNfxryTShi2kP6Yth00WKoix7TOOA3
 5sMz/yCmAWdUDKphUy8qYb8noUXDQw=
IronPort-Data: A9a23:wvqmO6OhfRXSxZnvrR3kl8FynXyQoLVcMsEvi/4bfWQNrUp212cEm
 zZMUGGCb/mNMDPzfYp+btm1pEtX7MeAndUwTwZtpSBmQlt08seUXt7xwmXYZnjLdpKZJK5EA
 2fyTvGacajYm1eB/n9BCpC48T8mk/rgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Pi5S31GGNimYc3l08tvrrRCNH5JzapD4et1oiUvFH1He2e649V8p3yQmZdhMUc6EMdgKIb
 7+rIIKRpws1yywQ5uaNyd4XRKGqron6ZmBiglIOM0Srb4MrSiYais7XP9JEAatbZqngc3mcB
 7yhuLTpITrFMJEgl8xFXDx3OSZ+E5FMw+OEE3+QvNfK7UTZJi6EL/VGVCnaPKUkwqNSLSRwr
 aVeIzcXdhaOm6S/26+gIgVurp18do+xZsVD5Tc5klk1Dt5/KXzHa4bH4dtJ6xctgM9mFO3Df
 IwSbj8HgBHoOUQUZQ1HV89h9AuurnDtXCZ6h26zmZA+6E3P1hFgwP/sHNWAL7RmQu0QxC50v
 Fnu9GP/BQsyN9GFzzeBtHW2iYfnhTv6V4IVCaa13vFviVyXgGcUDXU+T1yxobq1lma9VshZJ
 khS/TAhxYAx7l66VcvhWBP+o3mWuhkDQNlRUOEmwAWMzKPO5ECeHGdsZjVGbts898MqbT8nz
 FmEm5XuHzMHmL+SRHa19LKP6zK+fyEIRUcLYyMeQBQt6N7vrYo0iAnTVMtoDOi+idizECyY6
 zyHsik1iqkJgMMjyaq25xbEjiiqq5yPSRQ6ji3TX2S4/kZwfovgZIGy71XfxfJBN5qCCFiHs
 mINl8WX4KYJF57lvCiMRvgdWbiy//uIPBXYgEVzBN8m5TCk8WXleppfiBl6JUF0IoMHdCXvb
 Uv7pwxc/tlQMWGsYKsxZJi+Y+wt1aXmH9HufvTVdcZVJJ9jcAaN52dpf0H44oz2uFQ01KQzf
 InDKICnCmwCD6l7ijOtWvx1PaIX+x3SDFj7HfjTpylLG5LFDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:pEuMiKDZgTVf8ZvlHegXsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UwssHFJo6HjBEDyewKgyXcT2/haAV7CZnishILGFvAF0WKP+V3d8mjFh5VgPM
 RbAuVD4b/LfCFHZK/BiWHSebhA/DDEytHRuQ639QYrcegAUdAE0+4NMHf9LqQAfngjOXNWLu
 v+2uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmfLHOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dYOxY4kuW3vRYzSTFcRcso65zXMISSaUmRQXee
 z30lYd1gJImjbsly+O0F/QMkLboUoTAjfZuCClaD3Y0IrErHZQMbsZuWsRSGqm12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtVrQc/tQ0qbWIlUs4nkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNVeXdWrQsGVjyMGlGi1bJGbPfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCsUWcaV+DuEcRtbfMB2FfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPIcFyZMj8a
 6xJW+wdVRCCX4GJff+r6GjqCq9MVlVdQ6duv1j2w==
X-Talos-CUID: 9a23:qLNTJGCNiOPnQbz6E3Fo0WE+HcALTnfmkDTiJGC1Ej9LQaLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Ae1vNsAwZW09HqmYabgCgkvCoPmGaqK28J1svvqk?=
 =?us-ascii?q?gh/ONPglsISqMnHO2boByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from tp-md-v01.corpnet.asus ([172.22.47.17])
  by ms.asus.com with ESMTP; 23 Feb 2024 10:47:33 +0800
Received: from APZA003EXB.corpnet.asus (172.22.6.15) by TP-MD-V01.corpnet.asus
 (172.22.47.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 10:47:32 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (104.47.110.40)
 by APZA003EXB.corpnet.asus (172.22.6.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Fri, 23 Feb 2024 10:47:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0X/vF4DT7HAzEgC5HVBI3+fh1Z9TnNUpKXRbXgN/X17Ub0QK+1oEfCANxcwhbRp+GnCftB3yFXE8jQeO3Vm1ByPiI1H8gbaRaz77m70ipMDV65jxCMJP+TpQcjFNNrHXJFDn5TNGRnPXMIZrKpLMppK8TWDtrBoLy8osn4foulaEJy2PWOTxYwzt0CeLNsdjcv+XfoQYhr7VoyQ6IXCnmWzXMwbYT03Bp2mj+Hhms6lgUWY4FshnmDdty2F3uw7xcHcCJcocsTuImfOkXcvMIPuRbBDOc5KFgFVr+rtQfCF66JEd0DoJ258W0fv38PNtKtshZGAEAqs5L7fc6TSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHZ/3hl8/jOPxycyzuiRluFauCBvAyU9WqIuSeOjR7A=;
 b=nd95qHBGlnIWKFuPzfQECvEl8IdAZ226AGtieXyU8bGc8iUYzrwcXK3ypbGRCSrefIYDW3TQyfLinJzKLF0L5qguHptOz/mHWd+74Ss6O5c/CfIflJxp0SWymS/tDCTyP5jVVAIu0IybGh6E/NQrzJaknirUMmOetqkM6auXKdruedcmeMmeAXbnKBjoyLIH9NPBOMufHVOPVBxKbkuYQWPkhTX5n+fYz6QA046VaOJOm+ipqdLxuVpZnAMhT71+QJX2LldH9GNXAzbnD+CQr+HGZzcAXjdxvg0sVDvO8wayTgFdXoxumhNasgH2gWhHToPOb755n/WXDTqGDtXgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by SEZPR04MB7546.apcprd04.prod.outlook.com (2603:1096:101:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.23; Fri, 23 Feb
 2024 02:47:25 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 02:47:25 +0000
From: =?big5?B?S2VsbHkgSHVuZyiseLnFsvop?= <Kelly_Hung@asus.com>
To: Conor Dooley <conor@kernel.org>, Kelly Hung <ppighouse@gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Index: AQHaZW2EGhoS+Yb6HEqj0NWfX/LNULEWhhyAgAC0KkA=
Date: Fri, 23 Feb 2024 02:47:25 +0000
Message-ID: <TYZPR04MB6596ED7F905CB53191F48A289D552@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240222085914.1218037-1-Kelly_Hung@asus.com>
 <20240222-getting-nebulizer-8f75ba8063b1@spud>
In-Reply-To: <20240222-getting-nebulizer-8f75ba8063b1@spud>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|SEZPR04MB7546:EE_
x-ms-office365-filtering-correlation-id: 410d3917-9e1f-4569-190c-08dc3419c458
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pqcwMecnsHjYwvJ3lZ5vPMZwS3t4H46llZb3RLGHlnrCwN1YNR6f1X/zXqMFSh6DFsqNEPZRc77PuHCDmiQ0D03I6k0MQ0+mXXfv502kr/9S8cUMCGkaLNyEkKR+0VY3BSkTdR8wch0lvm73dFwPEalQbPnuEEXoo9cpq4bRofvFIamcVrqz4SI04iJmLPi0fn261O56rI3yuo9qLBPkDhzFvBoPKp06H2dw89xfKf+W9TUr+VPTKmCigSCS5/6uYPV6JjFQCqgVusRrLMzC2g3ZTN7GwCmiUfDpOjMpcZEjxFfYLsg5PpgratUviN+pbe9I7sBZ7VRmasQgrTgW1sf2KAzTgsyf4sEd132q+H9829xB9M9eFtvsQDLbHaSxlo5iNFOu7PlH2qYteYQdT0TYct7nugr8FOg85p9JRDk/dyxZngYPwG1LC6dA6OPcxJrnxFjludZ12pnLoXI58wKTIQE1xRXtD0tynnMPdvZfsX11Xq0EiFpR8plXYlJfDz6X7sK9sP/HtwUzB87ydGs9ksWpxSWEaZfhmbAzb+lADc3EnL9IedyJpmYFblD46mvsftrJSxiZ5v79UXHN4OU5/v30l7tnco1gP4qma+JLImrgQy0R7DEvFM+q+vms
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?dUFHUkpEY0tDaGUyNWQxS0ZzN2ZzQk1Ib2NsMXdmU2dTL3o4Q2tUdWY1eVQyRWlS?=
 =?big5?B?c3VSRjFCNlNzZDdUazU3RWtBYkN6cmNidGRpV3Q4d2JUVFRpWXFlb2grTFRxd0cy?=
 =?big5?B?TkFXRVEyRU5Ib0VocENBdVpDZWVFYS9OZWFibWxwaUVSbVo3SG1GSTBXTGVCUG42?=
 =?big5?B?b0JZU0RjeHBmKzB3S1pWV243cGJpZE5hWWRLNUpZRzI2L3pnb1dMRGlNQlRXZUNh?=
 =?big5?B?ZDluT0RaQzRLS1dTNEdacE95R2pERVUzUGpLYXNKS3BPMC92b3N5TUxucGNQZWdD?=
 =?big5?B?aDVPVGoxMVdCR3Y2M3BZWWs1RHhRMlU3SEdCQ0F2SHJ4d0dZeFRHcUJoSWQrSFVH?=
 =?big5?B?SVJabXB5MDhUc01oRzg0MnZyRUIxeHloMWw3RXQ4dDcwUWRRVUljcko4YStkS09O?=
 =?big5?B?YnJWMHJmVzZyamVsOTdmQzB6bE1uQ2oyUDNCRU1oUUs3WVdDdTlhU3g5NUR2Nk5y?=
 =?big5?B?bkJDY0YrRzltV2lPZDZDRG5JWkc0VTZsa05LSkRoTjJtSzVTNzhpekdFK25HME5F?=
 =?big5?B?cThsdGMvSlFjaHdUMmo4bVJnaWdkVDlOYnhWTGEzaWtKcjNmZVl0OXMrMHA4blpR?=
 =?big5?B?b09acjBHcVBveU5ZSXF4aVdoSEZweXh4Mmttd2dtL0F3dmJoL2NQdXNTaFpoWTBS?=
 =?big5?B?MjgvQWwyUW45bk1CM3RqOUdRMjZEZkJ1dWdKNFY0d0N3ZTJSZk1EM1ZNMnVuUEd0?=
 =?big5?B?MUhVZkhkSTZGTkxWT0N4a0FPRFVvNnNybHc1NTZiL2pyMDdoZCtqcHR4MkpsRmFh?=
 =?big5?B?bjBDRk9JTWp4RitBVE1JYUZUeU8zWi8yYXNmU2VEVlJmenBLRnZDZU9RZURaR1BN?=
 =?big5?B?cml2ZU0vcjhFeldkbjI1ZHh4Q3Z5aVc4bTc5ZzU0OU5PL09BVVlaQWp2WnYvcjVD?=
 =?big5?B?ZHNsZ1MweEVuazNxSzQ3Smx1Nk40bHpBQzBmdTBvYlA2eXVTZWJNTWc1NVNjTUNo?=
 =?big5?B?K0JpdVgvNGRCYTBJVmlqWWxOUUZCa1BBOXlmaHhFZDNyOVduZy8xTEFwWGdaMGJ6?=
 =?big5?B?MHo4Tzh2L3hDOFk3dlp4emZ0Ynh5T0g2eStNYXNneG5zTGEzdkFiUjZYd0xZejk0?=
 =?big5?B?NlZuemlUWm9VRmlVS1ZoZ2lNcU5kSHBuMWUwa2I4YnJYUnkyK2t6VzF2MDllUXdY?=
 =?big5?B?Zm9GUE1XZHN1SWJockp2czVlUThmT0RSd3JyM2ViTWRMOS9WMlhuV2dpSWJ2K1Rn?=
 =?big5?B?WFcwYnMyZGdJbE5TN0pqSzZ3a1hlUG81VVM4YVdJc3dWVVFncnFLUFNwZldjSmI0?=
 =?big5?B?N21nYlVXN1VaMStqWEYyV2JDaWZxUzlXcENUazVIRUVsTnpVYlVmc0NIdDN1cjhp?=
 =?big5?B?Skx4bXRMRzQwT0kvK2VlMlBLY0hXVVJVOWpjZ1YrazRGT21mNGJJSzFUK201Qkla?=
 =?big5?B?bHQwT2tQeGtkd2xUdmQrT3piM2NFc2xESUlJYWFaRkVPNjkxdy9Cc0pkTThKZ2dk?=
 =?big5?B?blJrYUFFSi9FNWk3NnlRWXBGNWdhYzdyOFltWXNlZHdxc2lJenN5bXZPdFFzM0FN?=
 =?big5?B?eFJENkNucnRoRDRJa3V1SmgzR01pVDd5ZWx4L2txdDJhZ0RiVzY1dnE5RzVrMkZt?=
 =?big5?B?Y1BzR2JEZWRRYU5RR3NNOWU4U2JLRmtBYml0VkNaRE1IdE1tREwyTVVQUDlxMi9v?=
 =?big5?B?b0txRGdaeDdxeFZUdDFuVDdMZGZoQnRkcUM0dDhlK1J5VXQvb2pYeXNvN3JYOGIy?=
 =?big5?B?dTVoeEZBVzdTcWpKa0NCcGtGV2NTS0ZQSmZSRGlkQ2M2LzFQNFlZVGNGdndVMXNB?=
 =?big5?B?OVFKLzRDR3Z2UERlRlIxa1kzQWg2RWZNRFkzQ0Q5WHE1VEowZkNPRkVIaG0zTkE5?=
 =?big5?B?MVFXR0toQSt1UXEzdHJOTGg2aEJZbVg3ZXB3TkdBU2pxUjJwTWwzNUNKRjViUWVs?=
 =?big5?B?Q2RncDVvWU9LRFozZWo4S1IxNlNLcTZNK0tlU3ViSmtDZzI5MDBHRFF2RWYrQm8r?=
 =?big5?B?Z1E4RlNhU2dwck5FeFFyMytIeFRJZzFuWkRmQkNWd3NWaUZmQnFneFRXMnIvN3h4?=
 =?big5?Q?94dXs1dBcid/M4NF?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410d3917-9e1f-4569-190c-08dc3419c458
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 02:47:25.2637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtSNVvy/1yCJBNgDWO42xzhDZqWda4uVQWJzMjrrVN369/GZSHZwuCBjSnDG3PuEUKsvKo0BwDxleK9WP8HipQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7546
X-OriginatorOrg: ASUS.com
X-TM-SNTS-SMTP: 	02EC1619D978F35FB92A605DBBC722D5202634C7BD54125BC69AF8E56F5DAFD72000:8
X-Mailman-Approved-At: Tue, 27 Feb 2024 10:43:30 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, =?big5?B?QWxsZW5ZWSBIc3Uos1ylrqmoKQ==?= <AllenYY_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RXh0ZXJuYWwgZW1haWwgOiBFbnN1cmUgeW91ciBlbWFpbCBpcyBzZWN1cmUgYmVmb3JlIG9wZW5p
bmcgbGlua3MgYW5kIGF0dGFjaG1lbnRzLg0KDQpEb2N1bWVudCB0aGUgbmV3IGNvbXBhdGlibGVz
IHVzZWQgb24gQVNVUyBYNFRGLg0KDQpTaWduZWQtb2ZmLWJ5OiBLZWxseSBIdW5nIDxLZWxseV9I
dW5nQGFzdXMuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hc3BlZWQvYXNwZWVkLnlhbWwgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXNwZWVkL2FzcGVlZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hc3BlZWQvYXNwZWVkLnlhbWwNCmluZGV4IDc0OWVlNTRhMy4uODAwMDk5NDhlIDEwMDY0NA0K
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hc3BlZWQvYXNwZWVk
LnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXNwZWVk
L2FzcGVlZC55YW1sDQpAQCAtNzQsNiArNzQsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAg
ICAgLSBhbXBlcmUsbXRtaXRjaGVsbC1ibWMNCiAgICAgICAgICAgICAgIC0gYXNwZWVkLGFzdDI2
MDAtZXZiDQogICAgICAgICAgICAgICAtIGFzcGVlZCxhc3QyNjAwLWV2Yi1hMQ0KKyAgICAgICAg
ICAgICAgLSBhc3VzLHg0dGYtYm1jDQogICAgICAgICAgICAgICAtIGZhY2Vib29rLGJsZXRjaGxl
eS1ibWMNCiAgICAgICAgICAgICAgIC0gZmFjZWJvb2ssY2xvdWRyaXBwZXItYm1jDQogICAgICAg
ICAgICAgICAtIGZhY2Vib29rLGVsYmVydC1ibWMNCi0tDQoyLjI1LjENCg0KDQo8cD48L3A+DQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+DQpTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIzLCAyMDI0IDEyOjAyIEFNDQpUbzog
S2VsbHkgSHVuZyA8cHBpZ2hvdXNlQGdtYWlsLmNvbT4NCkNjOiByb2JoK2R0QGtlcm5lbC5vcmc7
IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsg
am9lbEBqbXMuaWQuYXU7IGFuZHJld0Bjb2RlY29uc3RydWN0LmNvbS5hdTsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgS2VsbHkgSHVuZyiseLnFsvopIDxLZWxseV9IdW5n
QGFzdXMuY29tPjsgQWxsZW5ZWSBIc3Uos1ylrqmoKSA8QWxsZW5ZWV9Ic3VAYXN1cy5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IGFybTogYXNwZWVkOiBhZGQgQVNV
UyBYNFRGIGJvYXJkDQoNCk9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDA0OjU5OjEzUE0gKzA4MDAs
IEtlbGx5IEh1bmcgd3JvdGU6DQo+IERvY3VtZW50IHRoZSBuZXcgY29tcGF0aWJsZXMgdXNlZCBv
biBBU1VTIFg0VEYuDQoNCkl0IHdvdWxkIGJlIGdvb2QgdG8gbWVudGlvbiBoZXJlIHdoYXQgdGhl
IHg0dGYgaXMgLSBpcyBpdCBhIGJtYyBvciBhbiBzYmMgZXRjLg0KDQpPdGhlcndpc2UsDQpBY2tl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCg0KQ2hlZXJz
LA0KQ29ub3IuDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogS2VsbHkgSHVuZyA8S2VsbHlfSHVuZ0Bh
c3VzLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FzcGVlZC9hc3BlZWQueWFtbCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FzcGVlZC9hc3BlZWQueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYXNwZWVkL2FzcGVlZC55YW1sDQo+IGluZGV4IDc0OWVlNTRhMy4uODAwMDk5NDhl
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Fz
cGVlZC9hc3BlZWQueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL2FzcGVlZC9hc3BlZWQueWFtbA0KPiBAQCAtNzQsNiArNzQsNyBAQCBwcm9wZXJ0aWVz
Og0KPiAgICAgICAgICAgICAgICAtIGFtcGVyZSxtdG1pdGNoZWxsLWJtYw0KPiAgICAgICAgICAg
ICAgICAtIGFzcGVlZCxhc3QyNjAwLWV2Yg0KPiAgICAgICAgICAgICAgICAtIGFzcGVlZCxhc3Qy
NjAwLWV2Yi1hMQ0KPiArICAgICAgICAgICAgICAtIGFzdXMseDR0Zg0KPiAgICAgICAgICAgICAg
ICAtIGZhY2Vib29rLGJsZXRjaGxleS1ibWMNCj4gICAgICAgICAgICAgICAgLSBmYWNlYm9vayxj
bG91ZHJpcHBlci1ibWMNCj4gICAgICAgICAgICAgICAgLSBmYWNlYm9vayxlbGJlcnQtYm1jDQo+
IC0tDQo+IDIuMjUuMQ0KPg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NClRoaXMgZW1haWwgYW5kIGFueSBh
dHRhY2htZW50cyB0byBpdCBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBhbmQgYXJl
IGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIGl0
IGlzIGFkZHJlc3NlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvciBy
ZWNlaXZlIGl0IGFjY2lkZW50YWxseSwgcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2Vu
ZGVyIGJ5IGUtbWFpbCBhbmQgZGVsZXRlIHRoZSBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMg
ZnJvbSB5b3VyIGNvbXB1dGVyIHN5c3RlbSwgYW5kIGRlc3Ryb3kgYWxsIGhhcmQgY29waWVzLiBQ
bGVhc2UgYmUgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgZGlzY2xvc3VyZSwgY29weWlu
ZywgZGlzdHJpYnV0aW9uIG9yIGFueSBhY3Rpb24gdGFrZW4gb3Igb21pdHRlZCBpbiByZWxpYW5j
ZSBvbiB0aGlzLCBpcyBpbGxlZ2FsIGFuZCBwcm9oaWJpdGVkLiBBbnkgdmlld3Mgb3Igb3Bpbmlv
bnMgZXhwcmVzc2VkIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhvciBhbmQgZG8gbm90IHJl
cHJlc2VudCB0aG9zZSBvZiBBU1VTVGVLLg0KDQpGb3IgcHJpY2luZyBpbmZvcm1hdGlvbiwgQVNV
UyBpcyBvbmx5IGVudGl0bGVkIHRvIHNldCBhIHJlY29tbWVuZGF0aW9uIHJlc2FsZSBwcmljZS4g
QWxsIGN1c3RvbWVycyBhcmUgZnJlZSB0byBzZXQgdGhlaXIgb3duIHByaWNlIGFzIHRoZXkgd2lz
aC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo=

Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A4719A78
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 13:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX3DV0G7Rz3dqm
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 21:04:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=inWFS40g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=122.184.60.32; helo=inchng03.tcs.com; envelope-from=prvs=509b5236e=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=inWFS40g;
	dkim-atps=neutral
Received: from inchng03.tcs.com (inchng03.tcs.com [122.184.60.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX3Cn2W5gz3cR7
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 21:03:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1685617429; x=1717153429;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1t/bToOMVOFDgobuxt5dSIR5sFwX/c04yh9BlDnP9cY=;
  b=inWFS40gvfLBf8hQUAdGw684w+/7RYgevKEHv+MEix7l1u3S0MBqDYtk
   Qpn35mnIMdbQ5eunvoz7i2csuZJhuvFiRQbdSUyXlfOnzKxgWoiHWxe8Y
   /SBIV/hnKIqk83yupQWHLoH9fC8470JPk5RwlkLDdUabKaqNK+JwooRVr
   tdIJ6yfysP8AmeI91hQXQ+ERGr/eZltJ5uVVuLjQBd+PPM4rFqH0CXYkb
   VYvtBU2bsUqwB11v9hSz/xK2F2wct+3eoV94bd47yL6caxESFmQvZCoML
   81RiGg5yGmbQX69fcDjQzJV+s4J6uTtZJY2Hzg7vA9zUW41CPZGeVWgad
   g==;
X-IPAS-Result: =?us-ascii?q?A2CCBADOeXhk/xhEqgpagQkJg3Vzt1QPAQEBAQEBAQEBB?=
 =?us-ascii?q?wEBRAQBAYISgnQChWAmOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEA?=
 =?us-ascii?q?YEchS9GCIIvKQGENQEVaycEARqFU650AQEBdoE0gQGCFASdSIFogUKNL4Qxg?=
 =?us-ascii?q?k+BWIJoPoFTgnOEEoIuBI4tjXGBL3CBIYEmgQICCQIRZ4EOCGKBc0ACDVULC?=
 =?us-ascii?q?2OBI1U9gUcCAhE+FUp8DgERAwcEAoEHEC8HBDIJHwYJGDEnBlYHLSQJExVCB?=
 =?us-ascii?q?INnAwqBG0wVEgIRTTcDRB1AAwsbITQ9NQYOHwUEI4IkBHGBEUzHO6EKB4QLg?=
 =?us-ascii?q?V2fWBeDbAGlY5gOIKdqAgQCBAUCDgiBeoF+MxojgzhRoXgBPIEwAgcLAQEDC?=
 =?us-ascii?q?YtGAQE?=
IronPort-PHdr: A9a23:l8M1bRFr7NNHka9LqMWHbJ1GfxVKhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k30RmSDNyQsKkMotGVmp6jcFRI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffQVFiCCzbL52M
 Rm6ogvcu8cLioZ+N6g9zQfErXRPd+lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q
 6VAADspL2466svrtQLeTQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms8
 6tnVBnlgzocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSXZEUstXSidPAJ6zb
 5EXAuQBI+hWspX9qVUNoxSiCgejC/jiyiNRhnPqwaE2z/gtHRzA0Qc9H9wOqnPUrNDtOakPS
 ++1yrTHwivdYPNOxDzz7ZXIchU7rvGWQLl9dtHRxlMpFwzYkFqft5TlMymN1uQOrmib6vBvV
 fi0hm47tw5xuSKjydsrionMn48YzE3P+iplzogvP9K4VFJ7bsC+EJtWryyXNJZ6T8EgTmxmu
 Ss0xaMKt5G4cSQWyJkqyR7SZfyJfYaH/h/vSeacLDdkiH9kZb+zmwq+/Ea+x+HiUsS4zFZEo
 yxYmdfPrnAAzwHf5tSdRvdg/EqtxSyD2gHQ5+1eP0w5mrLXJ4Agz7IsmJcetFnPEjPylUj3i
 aKZbFko9vWt5uj6frnro5qROo1yhwrjKKohgNa/Dv49MgUWWmib/vmz26P78E3iRbVKkuU2k
 q7EsJDGPcgbprC2AwtS0os76BixFymr3tYAk3cJKlxLYhWJgZb1NlzOOPz4DPG/jEqwkDpz2
 vzKIqftDojPI3TfirvsfLVw51RCxAc81dxf4ohbCrAFIPL9QE/xs9nYAwciMwOuxeboFcty2
 Z0GWW6VGq+ZM77SsVqS6eI1OOSMeJMauC3nJ/c54P7uiGc1mVkGcqaxx5sYdGi4Huh6I0Wee
 Xfhjc8NEX0WsQomUOzqlFqCXCZJaHa0Qq08/C80CYy9AIjZRIChmr2B0zqhEpJMe2BKEkqMH
 mvwd4WYR/cMbzqfIs1kkjwfTrWhSYoh1Qq0uA/71rVrNPDb+jAAuZL5yNd1//HTlQ019TFsE
 8ud126NQnp3nmwSQD85wbpzoUtnyleMyaR4meBXFcRP5/NVVQc3LZncz/RkBND0QQ3Be8uGR
 U2iQtWnGjExUskxz8UJY0d8H9WtlAvM3zGwD78SjbyLC898zqWJ5GT8Kc97g1zLzqYslRFyW
 ddCO2SgjIZ79g7OF8jImUDfnKGvI+BU96/B7maIhU6D9G5fWRJ9S+2RVnQQTkjfqti/4VnNG
 fvmQ7M/Pw1LzMWqLqpRdsavikdCTf34ftPEbCj5z2CoCBCCw7ikaIvxZ35b2zfZAUIf1QcJ8
 iDCfUIYByGoryrmBTh1CFbiKQu49+h4oX+TSk4y0hHMbkdkkbGy/0hRzd6bRvdb5a4NviMsu
 n0gHlOm99DTEJyBq0xoYfMYKfo77E1Kyir7ugJzM4axZ/RrgFIEfhtftkGo1hkxA5gWwuYwq
 3Z/9wN0Ja+VyBtiajaRx9ikIbTRJmT/5Fa3aLPT00v2zN2NvKwI7aJr+B3YoAi1Gx96oD1c2
 N5P3i7Zv82SZOJaeZ7yU0Ni8R98qvmaZyQm/Irb2DVqNrX8qT7N3d8lRY5HghatdttSKuWIQ
 Qn1FcBJC82nMud/nV+vY1oNN/xT86hhOcSgerOG1aenMfwmkiihiDFb65s72UWJpEJB
IronPort-Data: A9a23:luKZJKKg8F57Y9YFFE+Rl5QlxSXFcZb7ZxGr2PjKsXjdYENS0jYBx
 mocD2uHa//bamTyKthwbtu//UoE6JHSy9UxGQI9riFmE3gT8JqcXNiVchb+M36ecJSbHBJqs
 50SYNLLcOk5HyTWzvuP3hgNjpXeOYWgHOeU5DvsY3gpLeNcYH59z0olwYbVu6Yw6TSDK1rlV
 eja/YuHYDdJ5xYuajhPs/zb8Us11BjPkGpwUmIWNKgjUGD2yiF94KI3fcld+FOlKmX8NrfSq
 9frlNlVzEuAl/seIo/NfoLAT6E/auW60T5iKJZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HC9YV9BA0HCpAgSewBjKAxTJa9ixL3GH3KSnfGC1FLDY1K5lp2CDGluVWEZ0sdRKkFo2
 dggDQwkM3hvhcrvmPTiFbEq2JRldpWD0IA34xmMyRnCBPAqTJ3bBb3J+NpRxh8sjdsIFvHbD
 yYcQWs3NESdPUQXZz/7DroSuOyE12POeQFbj0uKt7NqvnPtyTVuhe2F3N39P4biqd9utk+eq
 njL4EzwAFcbOJqW1FKt8He3ru3KhmX6VMQbCdWQ/fplqF6awWBVDwcZPXO8ufS/gEu1c9ZeM
 FAPvC08qaE47wqsVNaVYvGjiCfc+EdDA5wOQ6tgtGlh15bp3upQPUBcJhYpVTDsnJJeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:VYu6dKNY+17gm8BcT4T355DYdb4zR+YMi2TDiHoQdfUFSK2lfp
 6V8sjzjSWE9wr5K0tQ5+xoX5PwAE80lKQFr7X5Uo3SITUO1FHYSb2KjrGSgwEIeReOitK1vJ
 0IG8MVZbGefDsK7/oSizPIdOrIteP3iZxA8t2uqUuFIzsaD51I3kNSAgOfEkp5eQVCCYM5Ep
 2RwdZCrDa6EE5nFviTNz0rV/nlu9nBmInBbicPCRI8gTP+9w+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGOouy20RjV0k7U9tBzlMH6wtVOKcSQgoxNQw+cyDqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4Be+m7cZWa8pDrqwk3F3Cw143Hv5FeEiT/IoND/Rhg9F81d7LgpMSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Xs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgq/DXsZAV1Iv61eDlahiWn6UkPoJm/9TpC+CUrpAZHyHv6cegf2w
 2LCNU0qFgEdL5mUUs0PpZwfSLwMB2QffoHWFjifmgO18k8SizwQ+Sc2sRk2AnwEqZ4n6fb3P
 /6IQdlXatbQTO+NSVLtKc7oCwkhw2GLGHQ4/Ab2J54sLHZSKDwOSOOZUw0m9ahpfJ3OLyhZx
 /7AuMkP9bzaWTpAopHxAv4Rt1bLmQfStQcvpIhV0uJud+jEPymigX3SoeZGFPWK0dvZkrvRn
 8YGDTjLsRJ6U6mHnf+nRjKQnvoPkjy54h5HqTW9/UajNFlDPwCjiEFzVCios2bIzxLtaI7OE
 N4PbP8i6u+4W2753zB4WllMgdUSkxV/LLjWXVXohJiCTK5TZ8T/9GEPWxC1nqOIRFyC8vQDQ
 5Evlxyvbm6KpSBrBpSQ+6PIyaflT8etXiKR5ATlumZ6c3sf5YiAo8hQ7F6GgHEGxt4gg52pG
 orUn5zembPUjf1zam1hp0dA+/SM8Jxig+vJNVZsHTFqEuRos01TmYWUleVILmqaMYVNnNpb3
 FKgtsiaeC76ESSwEME8ZEFDGE=
X-Talos-CUID: =?us-ascii?q?9a23=3ApGsneGgD50mzfoqM7GfUMbMyrjJua0bm4VrIIWu?=
 =?us-ascii?q?EC2dXQpC5dE6L56Z0up87?=
X-Talos-MUID: 9a23:eCyzfAsoeMSanz9mQM2nqBVpGJZy0q6SC2cUjocf5pSfCylJJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,209,1681151400"; 
   d="scan'208";a="900856105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaAETOS9POX6r2yoteFZUemA6mCanm4zzO08oqaR5FoibpjJFVI0ZCqyatwYNR2f9wh+SMEHvuU/qrGNsjtI+xkXiolZ+SSg3RYIaaABvIPEs2yOMRbMJK6M5DoYx7Bjp/l/LZHoIegZEPD5eXum2bBzvwJSprwZtkPpipruWgDXvpyqghhMuqrj69FJML4iU2q4SIHO4yt7+qvxpKyP8JeWejVzFSVT30YMZgeNdQuYzBdl35jmtZQmsVf8tTK2fUQd2Efd7SDBdM3/Nr0N2GJpIHOafw53KPlBTKJpDDN5QXIIw1/30joHyqATbWAMerZK8mF/4ihnFvEfrhvJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvfvMKNBsVrBeN2IRKuN12sZ3ls9nysF7/vKF+gGfV0=;
 b=Ge9DLZItqOUB+4mt+x9QrAuohv3Xlyw2k/msbGTwYB1EoRUq1lo+740RU110YJOA3ZQaf+F6+dua+0VJpTqZhluYPZhVNiKWziOsOT1gBH42bBV8JZZry2w04Y3nYjWZAee2VnszDtXGMAJxCcWa5//yUZS70AINfj+qnbKebauRRR9hsBxfrt7sn6Hyos3L29wcDspyiYH9UfYv3pmjF983BKzIsHMcMUZBfHLHZRwhvY+og3UVjAUwyNMesvxe/FwKx4o9OpWB1pFmAZ2x0K/TP15xqIoXbg9AN+3Qhw/LwDFqxM2fTzkZaNBd5+v+QyI8XoT5o5pkGFZAzy/06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: Stefan Berger <stefanb@linux.ibm.com>, =?iso-8859-1?Q?C=E9dric_Le_Goater?=
	<clg@kaod.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ninad
 Palsule" <ninad@linux.ibm.com>, Joel Stanley <jms@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: Recall: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Topic: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Index: AQHZlHi4rd/qTqxESUuyfxIqtYw1Wg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 1 Jun 2023 11:03:39 +0000
Message-ID: <MA1PR01MB41298029C8877491914E8B4387499@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PN0PR01MB5830:EE_
x-ms-office365-filtering-correlation-id: 020d5525-0515-43df-53b5-08db628fdad8
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKJn96mkYyYmiEC8o8ISnnscCIzWuuSL2o50fi8PDSTBlxeQYz3dzk5Q0b5pDEql8ZR7+99XB8hPlkkwBRNe10WjRx/NPa5WY8zKwrkavIh+2pdQbmA0hzmdY9lPLM0S2nB9XxwRmHtyRhFUkvsQu3h0Gq3mVE/zrludZ75nisFwHzhmOexvGXsnGUXTDs2vNieTF2LNdrusszWHgcQwMFnseVT5nIGB82qst/Y255ZLwpYvLEJ2tHrdw6f1XnRQQDDtiCk8Q5CcVTA1mu940aeXonpNVRSx2evHEq5MGrx9fd3Lnhoiz4fawkitrt/pfDwqx4TaLzy+ukO31F/dld4WP43uxL/3b2ABBsWR86k7a5pH99/qt5IzVBqI+AkJkrJ7YHITGoYHR30BsqJ93suobQK3mWNkAvew0feTc99zbVn8X6E2VcuQvWlvYfBjoe302fRlX8EKrqVDi0GJFL95ydlPcG42mEnHxhlstxrSjLPQlq9z/u1/NLG/YXz+IKK1GY8Ik4Rz6F8cAq/iyuth80gtqJjKGUGr0yTCcPd2ZuuNGNIGZVMEDp2fb5mGfrjvbMOG9v8Wd7j7jsZePiEphs40SEGuwLN+OLsIe0J4AaEFFr82fvjLT53qljP0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(8676002)(8936002)(6506007)(52536014)(5660300002)(122000001)(82960400001)(186003)(2906002)(33656002)(558084003)(86362001)(83380400001)(9686003)(26005)(55016003)(316002)(478600001)(71200400001)(110136005)(66556008)(66446008)(66946007)(64756008)(7696005)(76116006)(66476007)(38100700002)(38070700005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Uw83d8vi3VgBO7Qql+RkrMvYvxOcIhsc+a0R0QYVWW9KA/6an4uDrCliVk?=
 =?iso-8859-1?Q?UlPiDqfpJdUMg3K+gtZZDm+yAAMmBFeUrMilullB2QoTFuOUsLBrtk6a22?=
 =?iso-8859-1?Q?ybO1eT0OUwiLTkotpXBZEb3+6yFZC10SkcKBM1vYvlDZzBK3HYzb2XNKPL?=
 =?iso-8859-1?Q?nrrpcDFbuIWICmvoOoz1+tTTwGKWRKRzK6wSgskGB5WaJW/zM7GNdpCHQ0?=
 =?iso-8859-1?Q?V7nrfDjR+QQ2jN6AD91e4xm1pvV7GhGhl99sH3YLJYzJG94akLofmrYI5k?=
 =?iso-8859-1?Q?kjqrSJqtHwBoDygMNFsmMKIoTtoq/UGywUEz/zKt7OlVxw7Z90ZdDI7e0a?=
 =?iso-8859-1?Q?qqcKzDbvQCwH6EjpmZpGea8RWdn+tsjA90kCjjjNc68Xc+eOb/KU5qqRrT?=
 =?iso-8859-1?Q?HCg4yXEnw2UbU6qzW11SXU/vIBEyFP4emGuO10xTvpHkoYb23Uyv7vB9Zn?=
 =?iso-8859-1?Q?1jnN1kHuAbf6my1PZSHdbe6+LsnDy1CwJD1aAF3RPar8CWlZp03RRsOcQ7?=
 =?iso-8859-1?Q?1g+SJBXWjCuK1G3N5xR6WyEj8gr4HdI/V6wFAussMY9ov8I5VpypT1B0yA?=
 =?iso-8859-1?Q?zV9ZotOJk2Lo8yHD3DwUDL8Lo5/SbiUNUj7x+GqzCmZJQm8fAmsed3kf32?=
 =?iso-8859-1?Q?iD0MUiwJYaQJzS1LrW31fAApGeBUPpK859Xrj3o6+DAV851DbzXrWL528B?=
 =?iso-8859-1?Q?pcW1sI4I0Fu8av67lVIzmdZCxnzp2RZ/w/TmWchghH/EbHQg4IqJAjYBWy?=
 =?iso-8859-1?Q?p3veqKYytfI0YwfnWDGAX4cDGX0mh/KpSQan1mj4wn8mDpQvVJPaN+5cI+?=
 =?iso-8859-1?Q?/TWy0rvjNMfVioBqRr9kZYTdQZbRtZ5uiiadteFFrd+hokD8wjI+GtkWYG?=
 =?iso-8859-1?Q?tFAmd33zF22eVJfgRW+7byfvBAibUTf85axdVikETJBhLbSakKr2Y6jwIT?=
 =?iso-8859-1?Q?UuHkR1mf+btetoHTDlfoIHdGV9WmmL/cGXMaSd+oQrDk1M+K7Zyg/vMkUH?=
 =?iso-8859-1?Q?OjqBiQlG3bBGEV6PI/S2k6GRktqi9eUJddLT2LgvKaiDkPcnsC7oHjNXxI?=
 =?iso-8859-1?Q?a9fkIAu69sI4T/DY3GZJifv0FW97/KMnuQLfHHlDGOMOWgbLhLCuRNg6xM?=
 =?iso-8859-1?Q?qCeLth5vYCxCHt3QHsZ8M6uBd/lKXXyK52QCyNEU7faNo//9OVZOEHPLYz?=
 =?iso-8859-1?Q?2sn0lhvQnRmIuhk6Gy9z2lWuOBf2DI8FiPPou7WHl0FekzXR3j43mbNrNX?=
 =?iso-8859-1?Q?kxSyIKCmyV/hLw4qdRPjpyk1Diwqbnj6gbMV//kqoTcZ29a77Ss/uZW5qt?=
 =?iso-8859-1?Q?NbfHTscCeXF65CseQRQBP2TLZbsa57Z7C+aVfIIAKnf3ikXchcpE34tQel?=
 =?iso-8859-1?Q?kXKcqpTfjb/O5AmcUSRCbQfxXi8CZWp3gEipdZtziZrbePoP7V+qK4QsH8?=
 =?iso-8859-1?Q?OijKI/Qt5ZOXK/ygemjm/iY0CB2X+Olb10eYCrDU3+J/e3Lu9DOH5t6btC?=
 =?iso-8859-1?Q?KCRw0wawDldUCMlLZZbRLMQsMzWm6CKUidlNSlS6q+D1nQPx3pbfIelAhk?=
 =?iso-8859-1?Q?YTw0ocsWKuQJbbTvDwem5dRV3CCLgc7yWHCGRvFOJ4nqwhc2w3vaXH1Q4B?=
 =?iso-8859-1?Q?hq4Dcvqd4N8HA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vzEXHSklzfEEy6ef5/U0Ia1S3UKC4GrzgXTfXX6/qnaN56AgU/ZdHfgWYGkr1cMhGWEraq9tEt45fnuLjSFGK+otc005BxFU+5ESnfi0PeHirh4vyIh5SgDgncW4J+WBM2N3cPMMAa6AZn+42L5DPT9nA5R5Cd6ww1gzMpW3ag7ihEn6fGwW22u7z0njpkbtNfupBSdbnydLz2u7Ri0jx685N8DPrPQikbPL8xaw1Ar/CmAmxdJISnU15WxyRz2kI0wV+3KqFXqCWIfPoAhBUc0Wu3snSvTonuWWW6Igo1hHrvYN73WJyJQI5DWX0E14KW/iJP6ssxd/35+AlkfhydJ57m+IAvHqBw9KbSb/JM8l/bP47WI/hrIN4Lgq3GJJ1mfD8C0MIR0jh1e3SGgbh0TywFk1kFW2Y8oR+Mzk6s3LDSBkelZTC17iVpBSNZFs1/2r2O9d6Hav0uDJimHATHM2M8Lj7FvE88IgCbAr3yDXb5++HdUkl4ugJUeXUNJ0ccxjzitGiHJ2H4EhU/DWCXPy5ZpNKzV7/qcyYeYt28UTmTZhbBnbUX5661zfTctBg+RJhmEGaFBaXjfTtlikqknmOQ2F7k5zDalgTnZB1pYjeK2MSqrmbRN0uDFZNrbonbopYVXdShiuIwVsdLxd9w9bvJzkVoSGUqr4CU53Xvq/t/7G5wuWAuVByTNRSq5PT4KepN+BxDPYPKA5072dZ8HThB3su57OPNv+4lSJeGZHW2YNe4mc7cYGU7fZ3+TeAd8Y7HqolZrrUE1YdYfhlRf0yz1QdB5deV+ZYOYrnhQ+lw7s5U4nfwFOL2yJLF5gJX2713MPRJQqOlP4aYECI/L+XVXCrn4PoqDYf/W9M5FzcQf73OaAg1hYf0WWUTfo
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d5525-0515-43df-53b5-08db628fdad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 11:03:39.4246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rb1RqAhBz19/peCH8jVVPe3LtlRefySbfwWgbjQJ5Y2MB1KBxlf3+ntR+CsocmZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5830
X-OriginatorOrg: TCS.COM
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27664.007
X-TM-AS-Result: No-10--3.433700-8.000000
X-TMASE-MatchedRID: 7P2Eg2GFL2sw/wKEiORH4pN65fjGjYMQfS0Ip2eEHnyBQ/4Wfo3opujt
	8OidvMO5W5xd15ThVVjdB/CxWTRRu4as+d5/8j56/lqFaUOLLgU5D/ZkVD7aL0j8URE4EX7+h+0
	Qona6jlTDCsfJWqw7Ad6zqLiz7m/o4tgAPw3ujJiGCZZTqemOqNWdnaEXCndz
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.433700-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27664.007
X-TM-SNTS-SMTP: A54540D4601DDFD715E559592965C1E0FDFEE8116508BD7B51C6BBC8D68E518B2000:8
Content-Transfer-Encoding: quoted-printable
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

Sandeep Kumar would like to recall the message, "Integrating swtpm(as a sof=
tware TPM) with OpenBMC on Qemu".
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you




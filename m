Return-Path: <openbmc+bounces-58-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B6ABE81B
	for <lists+openbmc@lfdr.de>; Wed, 21 May 2025 01:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b29t82zL8z3bYf;
	Wed, 21 May 2025 09:36:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.147.86 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747759870;
	cv=pass; b=f04o+Ss685InRN2dLJnetJce+MvFleoMCrWMYeyCfP3iBalsFirrewK8UUDEGPXVVQrOsaZ2mVTj4ZUaEt2ZMKGAggilv2xWdPcRNZYWOKuTN8T6/6NOLKRqEh/ed9e7brCloThb9/qnLVkEoQkQvTL5g/UE0zc+mf3l2oxq6TssrAS4J+qx79xYrcxOeepEwFZ58KFseVW/dMUM+SJCyXCIMF5hKvw5YG8v3k0hW9zCisAwPuIX1AxVRH+QsaXRTGnFOLh0tWwOP3T0TKUCDQgL5dmIr0rvHQ9Tr8BU44cpEoGnsdelxvgezvJJt13YnoGlL6OlifsWpAAGE15dsw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747759870; c=relaxed/relaxed;
	bh=yZSE86c5COSWeVqGVooYyAA256BrvhwuzjSBkAnb1og=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G22j1kVrWsEN9Hf9vaG+AbNp5wVXlVf3Mg/fNwez1FWiXzBkx51uAEkmuvKquVBHpTn7XB9p3nGLiNT6dJIYseSa7iAjKmCMdEXbuDYW3w8bfAnNCRWwcKXVNYinrDzi5NdyMmQ1tJj9u2Rta97ONWPAudC0WBNt/dsu/wrxFBOzbqzvvI3Jj1aXHG8KBOnti0E+m9jm9LnARWCEFpRoauIxJvAEMGjuMXNJw+g021f5jVxufwv/zdo9OuovIZxZhNepU1bMjY9BHbN0veh+VXjKG85hUGpwPH/A/ff9D6NwN40+elliek+Z+OMT1HnGAU4nZ0gFgzLevwLJq+eYPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V+RmsXNA; dkim-atps=neutral; spf=pass (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=matthew.fischer@hpe.com; receiver=lists.ozlabs.org) smtp.mailfrom=hpe.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V+RmsXNA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=matthew.fischer@hpe.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3356 seconds by postgrey-1.37 at boromir; Wed, 21 May 2025 02:51:08 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b20tj05QGz30g6
	for <openbmc@lists.ozlabs.org>; Wed, 21 May 2025 02:51:06 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEqanp029347
	for <openbmc@lists.ozlabs.org>; Tue, 20 May 2025 15:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pps0720; bh=yZSE86c5COSWeVqGVooYyAA256BrvhwuzjSBkAnb1og=; b=V+Rm
	sXNA8lVhWXZKakxXb4RPl0VuX60xYttNfxHdM8JUcZHEoKOJ5s/Uv8DhMLitoJIw
	gHUw+1xmTMlUtstf7kKlzAHrzUAIIkEvweswVJfVzirxQDgYPMhWjIUyj6Lt2k3R
	BO9D/eSFbJRZ1vRdgzNscx5IeOVWLtw7dz9qduTyFiEpebyKMkwOuoEeeaedDmYL
	JR60F9rPVxP3jpdsglMeW3vNOO2+8nzmCeILIF25HdXEvcghUHyD/fWUT51G20Vk
	7iIeWkY6IxjVQyQUOkmSfH5mGTUz86HxcnDrs9OTw27s5Y/e+SjZ+lri/v0472dX
	M86UPjxHN6VnpQfgQw==
Received: from p1lg14878.it.hpe.com ([16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 46ruvm8jce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 20 May 2025 15:55:08 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 08F5513147
	for <openbmc@lists.ozlabs.org>; Tue, 20 May 2025 15:55:06 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 May 2025 03:54:24 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11 via Frontend Transport; Tue, 20 May 2025 03:54:24 -1200
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 May 2025 03:54:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuMKlckmXkTI3dh4la6pEBrqWaUVlfozyjc7mSGbWmy/svtZDn+YI8Pyts8K0NS5zOd4EOu29ADVrbiYS1swwJxsFRGGnsILC8WGiUVg8CRF7bOGHOPt/sM5Cv72rspp+LRm0upuPOxER5p5pRCfY4gGAx+CtcVOCi+IPVjywg8VDeATzpJdcw10rfSG73CbvYxSjvu1ufyI/mM7GeqAh2S8FPOu1k+b8PHrYmxKYojd2Eguem3LqaJ+5BhcVDdb5v9bamUM+VdIwUJ/XDTwWxS9S6ayTjw79yHkA+HXtLqRVrNRIRqC4IZMTlIGMUtFrdjvVkPEdyO1zCew9KJR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZSE86c5COSWeVqGVooYyAA256BrvhwuzjSBkAnb1og=;
 b=v9iegwJzg4+z5G1pnOHNEkBB6t5T0N7mMWgkFAXUNgjjmvZYs4Mg8IPQGV3j+K+oNhQJh/6OyEC3hoyLTk6xh0z/VdTS+ww4Ws1ZLN7KHUrvObQ3y+1SOSG6LrHFAKCzmwSPmVuoBHGrmiHT22uUmdAXGOVF11Tbm9PnrRkxpNHjwo5GP0j70rentAIVc4EQorTvSbyYuxlxT3HwEuNTSRj1P1DJK0SzzH48yHMmN6PeTDio7prETO1nABLN7Ch3SekGd6JedhknQXLpoOqqLLglnw+9v4xHpuC80lImBmJlO8tqHR91e3UPUVWHTQ9AqPKMWtf7X4+y9XOK7+U9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:157::12)
 by CYXPR84MB3686.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Tue, 20 May
 2025 15:54:22 +0000
Received: from PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1d63:d4c8:c829:a54e]) by PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1d63:d4c8:c829:a54e%4]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 15:54:22 +0000
From: "Fischer, Matt" <matthew.fischer@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "Das-Caro, Aparna" <aparna_das-caro@hpe.com>
Subject: Update to HPE CLA for OpenBMC
Thread-Topic: Update to HPE CLA for OpenBMC
Thread-Index: AQHbyZ58uYbYB3XHx0CVAuGAClyCFA==
Date: Tue, 20 May 2025 15:54:00 +0000
Message-ID: <PH7PR84MB2245E09020AFD1F1581F94FCF09FA@PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR84MB2245:EE_|CYXPR84MB3686:EE_
x-ms-office365-filtering-correlation-id: 4c2925f6-7f4d-4107-8096-08dd97b69693
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|8096899003|4053099003;
x-microsoft-antispam-message-info: =?Windows-1252?Q?jdYE9YKtcFbS9COJlmdRKneW5u+j4dnRf9374SN12nOMbE9KPp7PBfXv?=
 =?Windows-1252?Q?8gXrzoqiFBX+EfZqWJ+AgAN61rgZaGAhcvVO8a0rPQyJrpT7bhYrp31V?=
 =?Windows-1252?Q?/78/9PaNt1o/IggU1HoQRW3LU1IsBIuSa0VyblQL3AuJgzSz0SU+s61I?=
 =?Windows-1252?Q?U6m9+bLbXnP19f1//2N2V6R7k0NgMSKswGaxwzCJOf9KY5qUI95cAH4f?=
 =?Windows-1252?Q?GzKPh31vtwFdbKsl83wuVp/uFBCwldyUoZueYHTgSFpf+pXIbGEu78NY?=
 =?Windows-1252?Q?12Pivog7rGXj6vDShv0nq3JTjvUFKdKYc76nH/y/ViTZRd50xd+le1cf?=
 =?Windows-1252?Q?ygUfA8VEA+ikjz8t69MxRDdN6hSZ4OlXkIsGQdayWTyPwqWrMhSSjIKV?=
 =?Windows-1252?Q?9OZsZHndvo49WQrv/B9QkSucHqccAF2g/k1ALmNMZzCHYdOPa0L8wtgc?=
 =?Windows-1252?Q?7VZ8ows9TLoOjOeJLKG07KjqMdVbheQFpJgN75OqiKdHWA+mw5ILeKIZ?=
 =?Windows-1252?Q?X/8fOoYhd0CF7Zlupal4pthPV7pug1iroV03cNuYksNOk9hn6nXY8dwc?=
 =?Windows-1252?Q?XstJCosdCS+WCl+W19BRbIarFqwu7G/ZJtrZcxwdBXn5cnabzgUe9DkD?=
 =?Windows-1252?Q?0b8Q7T54TO8IGRv5mTJD+uMyNy9LE87NCbHzIntBzEaFkGzIfLP3KTTw?=
 =?Windows-1252?Q?wnKC2hZG5VETh1qjeQz6GdernRhBGR2Ww9OTGgom64HN0/uzwsnxzBBn?=
 =?Windows-1252?Q?QYsI7Q13niXbsm8Tzu5yC7m3BrlMv0nBhKTpDCKGM7XdiJXUruhpDdhj?=
 =?Windows-1252?Q?ygCKYArCpyNrZt1c5q2nHf4tdXBIkVstX5cYwA+csXQD3jmgQ3os77d+?=
 =?Windows-1252?Q?QrCB535LeDSf0HDUQwgiVoV0dy6oJR9lhikRFeT9SHDh+vG3aC6Cr0Cz?=
 =?Windows-1252?Q?TjtAS9jRV3+3Ur/INHeD+Ma5/vZXNDg8qhFNCttOWNotD3W6UF29AHpd?=
 =?Windows-1252?Q?Lb2RZCxUw+kBIu1qbfgKjm9+slT8YNT4Ns55aIVE9tqVAL7LkNRx0l03?=
 =?Windows-1252?Q?P7Utb4iex6NqjtsdMXNUXXfV1C9TQPI+D5H7rgwAGWKG5a/dBzlru/fV?=
 =?Windows-1252?Q?s0JFPuMJEjd/w5WX01cF55Y74l3AIZ4bOnx3F4/3zkDhgqzS8shtRmkL?=
 =?Windows-1252?Q?pZDU/s0A/GeXNIjdD5lAovOcyAmGd9WufT7PbVPLUYx5+wYcKlV8rWdb?=
 =?Windows-1252?Q?m24/Doc1GIPr30Rm7no34UNmZohp5f+nQWMcHTRL7dUFUC+qZzLfVXyy?=
 =?Windows-1252?Q?+jnwP+JyMAily0+jFhmp1SCBnTF41SGhhomn4PzjTo1kNSRg+gH/Ueyh?=
 =?Windows-1252?Q?rSuLWYp/vo+7X22Bur7FA34md5v5wbkTQty+nKoMOrqoJh7LGVav1PoN?=
 =?Windows-1252?Q?42CZ4ej0/oxqnlqjJRjuDNPymDj2aJyUD0a/0hPY0B3VRhNMD0NubEkL?=
 =?Windows-1252?Q?R2ofglbQ932e4a1p8Wt31ADdliXADsBeS8kOEzR0Lbv2hzWS6EU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?CM/pe4V3+0kPxcQX+HAEq7FXQ2rtGNkivJbp09Uh/+CeTxd+KmuRHsIW?=
 =?Windows-1252?Q?Btmj/oeWX8uI20L9GDJg3rRRX+4z6M1/D7cciZIMTpPNjEYRCKagLdj2?=
 =?Windows-1252?Q?MyizlZ8C+/776ptUulyRpgWtaqJgpzEeqz18cCn5byzgmxIHHS03Wt48?=
 =?Windows-1252?Q?OYaoZR5H9bpvyPGaiYFwqaA0w047r74h/OlJa5Tg+ahYo4bFCmH9x0E8?=
 =?Windows-1252?Q?S7sntLrVBo8a6vFNZMMxbczHxx5P1L1+cHEyLX9a1zf6JqDQwhDK1E5P?=
 =?Windows-1252?Q?rLvHL1hwUS+jjhravCIn+rUFulq1qTYahF5Z2BTQ63nv4ZlzmvCCLchh?=
 =?Windows-1252?Q?j2ceqFbJEe31jZmqrgqb7TIA5+13pU8JCpk+ZM/GDRJmwIkMg5Z4pxHo?=
 =?Windows-1252?Q?kBTE/NfROwOnCw33jufNJ3Zj/QBkdqRGPxLoOaMApesCUiiH8+01hZ3i?=
 =?Windows-1252?Q?cg1Gt/Hz+fkJ7+fQ/vYKfzJGUHYAjrLh1GE8xsNw+jRPOH0TwL2rofNG?=
 =?Windows-1252?Q?iYW2qj5Mi1242ZppR8z7wpPkus8VLEruOY8BgLK48/LbSAr5eRdkieRX?=
 =?Windows-1252?Q?0sIR02qeaA3V2wb80+DRr715w6J/652JM0CVh2KdbF7nA6qqewc3C0e0?=
 =?Windows-1252?Q?X6laVuV+W/jBkYHFDZjnWLTyiHV1rQ/zsARVUm2lFKzhtvTsr1NTkJ8E?=
 =?Windows-1252?Q?g56D6m2HW2MQvA+dPUQAt2OU3TQclFxWY9dAiQX64kilioB6EhaEKfdW?=
 =?Windows-1252?Q?o81+7HpCvmyYRBUpFpR8SIzCbIur797kdiN4RfXv+FY+X4Wyzxl2E/VM?=
 =?Windows-1252?Q?gKkJVc+2PuxLryXbCb/dEzQOZ8Y67teFlHV5z9Qq/0jNlYwodLx9TSIj?=
 =?Windows-1252?Q?Yi3oBa0qXGbT6qxjsFnJfOINem7cT3AWaiAAyREcSrt/k6rNG7zm0AI5?=
 =?Windows-1252?Q?abZH56XfetSEGEVHpvJ+kVneGRb9DemJkqOGr6i5jzwnc2XFIh73qoDI?=
 =?Windows-1252?Q?OsZOYmv1FRf2NIG53Ln0RMFbuuybXCOf5pB4RVco9/gF7vrJVjKU8iAE?=
 =?Windows-1252?Q?VJ9WSFEWJmhfqckl1TtrzWmnBKx2g/sZkbTlM3mRhBtEXQQjQn6EZ4jy?=
 =?Windows-1252?Q?TWDGuhl2kybvptBS8hbs1u6emBSJLpSzX8oIjyBdZKjj9ui3HLI3s3xO?=
 =?Windows-1252?Q?7dyvUuhVVNzoOprO4TymDwTHsE5qrKffreLcGgbQoR85GMKNnKWUqcjM?=
 =?Windows-1252?Q?5G0ELVlMoakBF5ytkWoKSJKfgsA9lLhlPY8cVXplKKx2bX8VnL6FutIU?=
 =?Windows-1252?Q?BqFbHF1Whnooxnr20ohYXeW5U3KafCTCkHqXWZXHxQKNhRINWW1NpLKC?=
 =?Windows-1252?Q?fFGJuLskBQ4F2Z5wM+mA5JW4PmkVD96ctIzSKNElyFh1KKNfKKKp0fzP?=
 =?Windows-1252?Q?ikxu6SMrS5KjI7xORD/vGvXYol0OX4+T1pyO9dVoWOiCcIcEKNOcz4Pg?=
 =?Windows-1252?Q?whfVAvLW3RiizJ7Dxooaj41rnbNfHSJ31BpjacmZXQCgXkjBxZpbGbpJ?=
 =?Windows-1252?Q?HYG6XQkcjIgLpQU/6v9YkQoDjMbrGKU/8IwHVau7+JCj4mMuCJ58peA7?=
 =?Windows-1252?Q?4vsVSqzfKpALyuSt2x69M2hvqJu/cKfyU+5LuR3yFbP8/YPMzObtEbz5?=
 =?Windows-1252?Q?nf2f0v5Gn3WC02jH6PwlwayzWis/vUB6sFqt47D5nV0srDClleLl2g?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_004_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_"
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR84MB2245.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2925f6-7f4d-4107-8096-08dd97b69693
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 15:54:22.2102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtKAHxBUnb40ZiNDhKViYjGLqF5HNM28kjX53BMIqYtBMu2s2OWa5+zwPr8DAvTOY7YSSjQwQ7T/SjbLLdYqyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3686
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: Sq628_IS96vvskPCdYJBl81SzLoY2X8z
X-Proofpoint-ORIG-GUID: Sq628_IS96vvskPCdYJBl81SzLoY2X8z
X-Authority-Analysis: v=2.4 cv=KavSsRYD c=1 sm=1 tr=0 ts=682ca5dc cx=c_pps a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=Cb2rOyjL84VzgnZzwrAA:9 a=pILNOxqGKmIA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=ZtkdCPt0BMD06M1M7awA:9 a=GrfbBqcHJieJ9k6v:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=dUv7o20v-wpjNKRDvzoA:9
 a=n3BslyFRqc0A:10 a=rls1ZAiwvL0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyOSBTYWx0ZWRfXzusL2nawB7O+ yeRizXi9K8jvwmE3LOnrI0J7m/E4Pkuzk0d6wWO/AF+QFQirlMrJdSPz6kV0sP1UwWXbV/vahew faVWzWG7R5qVbHUfqTDcQV+9T9IdXLIw7B41cR+W7iNra/ygxjnSnd4dK0xt6uzOHOO1gfiIsCq
 csKOojldSNXMwGPnJnepcYg24mCJOvk/TrsjI9c2j1VeCQE5gcVCouQbScm6oVEZPk0irNEcM0R soBxydF/pIuhuIU1HK3Yq9COKDPfIqviiPGzPRZ4HpO+jz9fZaO6f4smg+1aBSEOAZT3U3eaVOc 7vWiFVGS0lRaVIs8JXgPLAEQLEJ8Xw4Qwf1ovjQz0+NR3e8pLqvYOsqKhuvivBeykGIhEsV/fzU 3gEMhkXX
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=949 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2505070000 definitions=main-2505200129
X-Spam-Status: No, score=-1.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_004_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_
Content-Type: multipart/alternative;
	boundary="_000_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_"

--_000_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I am attaching an update to the OpenBMC CLA for HPE which makes the followi=
ng changes:


  *   Removes Grant O=92Connor and a few others
  *   Adds Dan Lewis
  *   Adds Bhavani Jayakumaran
  *   Adds Aparna Das Caro as an owner.


--_000_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:611864789;
	mso-list-template-ids:1837502494;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1
	{mso-list-id:955798650;
	mso-list-type:hybrid;
	mso-list-template-ids:1541335870 -2111020188 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Aptos;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7 ;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">I am attaching an update to the OpenBMC CLA for HPE=
 which makes the following changes:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo3"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif">Removes Grant O=92Connor and a few others<o:p></o:p></span></li><li =
class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo3=
"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-seri=
f">Adds Dan Lewis<o:p></o:p></span></li><li class=3D"MsoListParagraph" styl=
e=3D"margin-left:0in;mso-list:l1 level1 lfo3"><span style=3D"font-size:11.0=
pt;font-family:&quot;Calibri&quot;,sans-serif">Adds Bhavani Jayakumaran<o:p=
></o:p></span></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;=
mso-list:l1 level1 lfo3"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,sans-serif">Adds Aparna Das Caro as an owner.<o:p></o:p></spa=
n></li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_--

--_004_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_
Content-Type: application/pdf; name="Schedule A.pdf"
Content-Description: Schedule A.pdf
Content-Disposition: attachment; filename="Schedule A.pdf"; size=38281;
	creation-date="Tue, 20 May 2025 15:53:27 GMT";
	modification-date="Tue, 20 May 2025 15:53:27 GMT"
Content-Transfer-Encoding: base64

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
7IwbjZjR79GAvCG+AZjjOmZE8sQGdF1EadeDxM7S8SwlLXpIPyNzohNmkyMep0P5BvYUvp+OlIf7
JMcd3ThywY65yH2PTvyTxwtSU4xfiHp+K9LToURHO2/z5JPTaRdbRGvjZt4JCdohi9CAO1rEFKaf
TuEw+NI4QI6P1NGGD6VSCh901gofj+F0DzZYr2cXS5k1vr9GLEfhhFOp4agfpeD4dv64fkO8YXKU
TaDHAUNWCzXYAW8OdnQgci3r1DM7OUcbOhhMS+RIAPfpmJl2iJXcXuRQgDuSQ0wwcZeYgmIEhdhw
BpnSt1BDx04mH4gP/iG0SmJxVsuLd3LzqSuiyInbaL7BUSWPd1+hyJXMJzHjSG0gKt0vTm9hnlEb
jPEt2LACB6qj033yOJ3Mp7O2ewlrY6dxL8QkTenczqWRBvyt7Q4jKrt7JX0MMRwcssR2dJu8HMZt
D3Lc8T0CXMAPQ+rwyW0x3Z0EcnLW8nSqeLyG7qd8WVZNbOUMXieKdWbngkUD7qhYrDmK4qejLQZX
Oo7Rdi5s2psCadn1Y/V2DrP3c618TT/AEck5OKOlsgisx/56gUo/PV4NaDps8dwZJVZWkqQQU7UN
+54VMU4BHlYbTpbFUuKUbCOJgzKinZIDZEY/BvtCerxll+9ibEQOvehbsslhkylJhY5pTKVCvXO1
N6AQNDbELfG9DK13++7WGA14WGNJyXdAY4p0icYworKu+EcE2P9h12b6awAf0JmknT+YlyjlyMsO
wbzXlRba+L3z9IqNTHnWCihz+1jhEBI8MQbOHkcSs75H/7NpKP3dQqc/sODCBiZ2n9A1xzgqRaOt
DLwgjhoumStOP53u6Yehx2Fa2iwkYeJab6TOn/4LhxOjOwplbmRzdHJlYW0KZW5kb2JqCjEgMCBv
YmoKPDwgL1R5cGUgL1BhZ2UgL1BhcmVudCAyIDAgUiAvUmVzb3VyY2VzIDQgMCBSIC9Db250ZW50
cyAzIDAgUiAvTWVkaWFCb3ggWzAgMCA2MTIgNzkyXQo+PgplbmRvYmoKNCAwIG9iago8PCAvUHJv
Y1NldCBbIC9QREYgL1RleHQgXSAvQ29sb3JTcGFjZSA8PCAvQ3MxIDUgMCBSID4+IC9Gb250IDw8
IC9UVDIgNyAwIFIKL1RUNCA5IDAgUiAvVFQ2IDExIDAgUiA+PiA+PgplbmRvYmoKMTIgMCBvYmoK
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
+nMYLiw0rCbsebhVeH54dwQtYkVEQ8S7SI/I0shHi40WSxZ3RslHxUXVR01Fe0WXRUuXWCxZs+RG
jFqMIKY9Fh8bFXskdnKp99LdS4fj7OIK4+4uM1yWs+zacrXlqcvPrpBfwVlxKh4bHx3fEP+JE8Kp
5Uyu9F+5d+UE15O7h/uS58Yr543xXfhl/JEEl4SyhNFEl8RdiWNJrkkVSeMCT0G14HWyX/KB5KmU
kJSjKTOp0anNaYS0+LTTQiVhirArXTM9J70vwzSjMEO6ymnV7lUTokDRkUwoc1lmu5iO/kz1SIwk
myWDWQuzarLeZ0dln8pRzBHm9OSa5G7LHcnzyft+NWY1d3Vnvnb+hvzBNe5rDq2F1q5c27lOd13B
uuH1vuuPbSBtSNnwy0bLjWUb326K3tRRoFGwvmBos+/mxkK5QlHhvS3OWw5sxWwVbO3dZrOtatuX
Il7R9WLL4oriTyXckuvfWX1X+d3M9oTtvaX2pft34HYId9zd6brzWJliWV7Z0K7gXa3lzPKi8re7
V+y+VmFbcWAPaY9kj7QyqLK9Sq9qR9Wn6qTqgRqPmua96nu37Z3ax9vXv99tf9MBjQPFBz4eFBy8
f8j3UGutQW3FYdzhrMPP66Lqur9nf19/RO1I8ZHPR4VHpcfCj3XVO9TXN6g3lDbCjZLGseNxx2/9
4PVDexOr6VAzo7n4BDghOfHix/gf754MPNl5in2q6Sf9n/a20FqKWqHW3NaJtqQ2aXtMe9/pgNOd
Hc4dLT+b/3z0jPaZmrPKZ0vPkc4VnJs5n3d+8kLGhfGLiReHOld0Prq05NKdrrCu3suBl69e8bly
qdu9+/xVl6tnrjldO32dfb3thv2N1h67npZf7H5p6bXvbb3pcLP9luOtjr4Ffef6Xfsv3va6feWO
/50bA4sG+u4uvnv/Xtw96X3e/dEHqQ9eP8x6OP1o/WPs46InCk8qnqo/rf3V+Ndmqb307KDXYM+z
iGePhrhDL/+V+a9PwwXPqc8rRrRG6ketR8+M+YzderH0xfDLjJfT44W/Kf6295XRq59+d/u9Z2LJ
xPBr0euZP0reqL45+tb2bedk6OTTd2nvpqeK3qu+P/aB/aH7Y/THkensT/hPlZ+NP3d8CfzyeCZt
Zubf94Tz+wplbmRzdHJlYW0KZW5kb2JqCjUgMCBvYmoKWyAvSUNDQmFzZWQgMTIgMCBSIF0KZW5k
b2JqCjIgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9NZWRpYUJveCBbMCAwIDYxMiA3OTJdIC9Db3Vu
dCAxIC9LaWRzIFsgMSAwIFIgXSA+PgplbmRvYmoKMTMgMCBvYmoKPDwgL1R5cGUgL0NhdGFsb2cg
L1BhZ2VzIDIgMCBSID4+CmVuZG9iago3IDAgb2JqCjw8IC9UeXBlIC9Gb250IC9TdWJ0eXBlIC9U
cnVlVHlwZSAvQmFzZUZvbnQgL0FBQUFBQytDYWxpYnJpIC9Gb250RGVzY3JpcHRvcgoxNCAwIFIg
L1RvVW5pY29kZSAxNSAwIFIgL0ZpcnN0Q2hhciAzMyAvTGFzdENoYXIgODQgL1dpZHRocyBbIDQ1
OSA0MjMgNTI1CjQ5OCA1MjUgNTI1IDIyOSAyMjYgNTc5IDI1MiA1MjUgMjI5IDMwNiA0NzkgMzkx
IDMzNSA1MjcgMzA1IDQ3MSA3OTkgNTI1IDQ1MwoyNTIgNjQ2IDU0NCAyNjggMzQ5IDM5NSA1NTcg
NTMzIDUyNSA1MTcgNDE4IDQyMCA4NTUgNDE4IDQzMyA3MTUgNDUyIDYzNCA1ODMKMzE5IDU2NyA2
MTUgODkwIDUyNSA0NTkgNDg4IDQ1NSA2MjMgNTIwIDYzMSBdID4+CmVuZG9iagoxNSAwIG9iago8
PCAvTGVuZ3RoIDUxMSAvRmlsdGVyIC9GbGF0ZURlY29kZSA+PgpzdHJlYW0KeAFdk0tr20AURvf6
FbNMF8FjzdhKQAhCSsCLPqjbH6DHyAhqScjywv++57tOU+jiGI7vzOh+89i8Hj4fxmF1m+/L1B7T
6vph7JZ0ma5Lm1yTTsOYbXPXDe36bvZfe67nbMPk4+2ypvNh7CdXlplzmx9MuazLzT28dFOTPum/
b0uXlmE8uYdfr0f753id59/pnMbV+ayqXJd6lvtSz1/rc3Ibm/p46KgP6+2RWf9G/LzNydERM7b3
ltqpS5e5btNSj6eUld5X5dtblaWx+68Ui/uMpn8fmm+rUni/C1VW5jkK3u9NAwrok6oRBXQn3aGA
RukeBe8LqxYoUG1VfULB+9xLn1HwPm6lNQros7RBgblJ2qKAWrVDgaU6VRMKVG2pvioDG0AbihAI
J6j2UsKFe6K9lDSCqpYKpBHMVZOBNALVdwNpBN9VV4E0gp5NSRPuiXJVSSO85xcljWApq5ImWKLC
qrQfLEK0nhUB6EqDI2kEZ6Su2DAj91ttbCQRs6hGU9JEoKpEkTSC7+oEI2kEWkhJI1DtBntv9A03
CKV9wcpqMtK+oA0bTPt8UVWdfuRABFVbmTRsC1roUCJpBIM1lxwGqquyI5EgbyMlkaCqnrmYBmpV
wu3syOhcV/zvXdZt16v8eEXtdVl4QPZ07W3pzQxj+njd8zRrAeMPni8GmAplbmRzdHJlYW0KZW5k
b2JqCjE0IDAgb2JqCjw8IC9UeXBlIC9Gb250RGVzY3JpcHRvciAvRm9udE5hbWUgL0FBQUFBQytD
YWxpYnJpIC9GbGFncyA0IC9Gb250QkJveCBbLTUwMyAtMzEzIDEyNDAgMTAyNl0KL0l0YWxpY0Fu
Z2xlIDAgL0FzY2VudCA5NTIgL0Rlc2NlbnQgLTI2OSAvQ2FwSGVpZ2h0IDYzMiAvU3RlbVYgMCAv
WEhlaWdodAo0NjQgL0F2Z1dpZHRoIDUyMSAvTWF4V2lkdGggMTMyOCAvRm9udEZpbGUyIDE2IDAg
UiA+PgplbmRvYmoKMTYgMCBvYmoKPDwgL0xlbmd0aDEgMzE2NzYgL0xlbmd0aCAxNzQxOCAvRmls
dGVyIC9GbGF0ZURlY29kZSA+PgpzdHJlYW0KeAHVfQlYXNXd/rn3zr4w+zALMDMMDJABJuyQBSZh
hyQEEhJIQgIhu2RPjJpE425prVqtVqtVW6ttY3WYEINLNfVLF9vGqnWpVq32a6vVYu3uBvzfc84c
QqJ+3/c8/+f/PN8f8/K+59xzztz7O+v9nTO4b8/+jcRIjhCFzB7cPrCLsJ85OtCRwfP3BXk40kCI
+rFNuzZv5+FCkDm6eejCTTw85wNC4t/csnFgAw+TT8CVWxDBw1I5OGfL9n0X8HANLeDVoZ2Dqetz
rkF41/aBC1KfT15FOLhjYPtGnv7g7TS8a8/G1HWpB8W9y6/9F78lXKsim4iadOD5ZGIlMXI1IfZK
uQIhCf8Roikru1t/x8Q6y7x/Ei99bEIefffQLyi/cPPwpo8/mjii/7OuEkE98vAf5NN+Y+IVQgx3
ffzRR3fp/8xKSl1kVDWiVxYsk38q/5hUk4D8kxS/RqrlV0i3/DL4JfCvU/wi+AWEnwf/Cvwc+Fnw
E+DHwT8AP0a6iUr+DSkHlgPKtNqA0D3A84CanIeSJGJEfok45SdJA7AB2AfcBKiR9nFcuwclSiQo
XzGq90htwTH5ciEuE+JSIY4IcYkQFwtxWIhDQhwU4iIhLhTiAiEOCHG+EPuF2CfEXiF2C7FLiJ1C
7BBiuxBDQpwnxDYhtgqxRYjNQmwSYqMQG4QYFGK9EANC9AuxToi1QvQJsUaI1UKsEqJXiB4hVgqx
QohuIZYLsUyILiE6hVgqRIcQS4RYLMQiIdqFaBOiVYgWIZqFaBKiUYgGIeqFWCjEAiHiQtQJUSvE
fCHmCTFXiDlC1AhRLUSVEJVCVAhRLkSZEKVClAgxW4iYEMVCFAlRKERUiFlCFAiRL0SeEBEhcoXI
ESIsRLYQISGCQgSEyBIiU4gMIfxC+ITwCuERIl0ItxAuIZxCOISwC2ETwiqERYg0IcxCmIQwCmEQ
Qi+ETgitEBoh1EKohFCEkIWQhCApIU0JMSnEhBCfCPGxEB8J8aEQHwjxbyH+JcQ/hfiHEH8X4m9C
/FWI94X4ixDvCTEuxJ+FeFeId4T4kxBvC/GWEH8U4g9C/F6I/xTid0K8KcQbQvxWiNeFeE2IV4X4
jRCvCPGyEL8W4iUhXhTiBSGeF+JXQjwnxLNCPCPEL4V4WojTQvxCiJ8L8TMhnhLip0L8RIgfC/Ej
IU4J8R9CPCnED4U4KcQTQjwuxA+EeEyIR4V4RIiHhRgT4oQQDwlxXIhRIY4JkRRiRIiEEA8K8YAQ
3xfifiGOCvE9Ib4rxHeEuE+Ie4X4thD3CPEtIb4pxN1C3CXEnUJ8Q4g7hLhdiK8LcZsQtwrxNSFu
EeJmIb4qxE1C3CjEV4S4QYjrhbhOiC8Lca0QXxLii0IMC/EFIa4R4mohrhLiSiGuEOJyIS4T4lIh
jghxiRAXC3FYiENCHBTiIiEuFOICIQ4Icb4Q+4XYJ8ReIfYIsVuIXULsFGKHENuFGBLiPCG2CbFV
iC1CbBZikxAbhdggxKAQ64UYEKJfiHVCrBWiT4g1QqwWYpUQvUL0CLFSiBVCdAuxXIhlQnQJsVSI
DiGWCLFIiHYh2oRoFaJFiGYhmoRoFKJBiPpjdLU8Jl+RzKoNYM2czHKBLuOhS5NZcxA6wkOXcLo4
mWVC5GEeOsTpIKeLOF2YzFyAJBckM+tBBzidz2k/v7aPh/Zy2sMjdyczFyLDLk47Oe3gSbZzGuJ0
XjKjESm3cdrKaQunzZw2JTMakGQjD23gNMhpPacBTv2c1nFay/P18dAaTqs5reLUy6mH00pOKzh1
c1rOaRmnLk6dnJZy6uC0hNNiTos4tXNqS/pb8QytnFqS/jaEmjk1Jf3tCDUm/YtADZzqOS3k1xbw
fHFOdTxfLaf5nObxlHM5zeHZazhVc6riVMmpghdWzqmMl1LKqYTTbF5YjFMxz1fEqZBTlNMsTgWc
8jnl8aIjnHJ5mTmcwpyyedEhTkGeL8Api1MmpwxOfk6+pG8JjOXl5En6OhBK5+TmkS5OTh7p4GTn
ZOPXrJwsPDKNk5mTiV8zcjJw0vNrOk5aTpqkdyk+XZ30doJUnBQeKfOQxIkwkqY4TbIk0gQPfcLp
Y04f8Wsf8tAHnP7N6V+c/pn0LA+MSf9IepaB/s5Df+P0V07v82t/4aH3OI1z+jO/9i6nd3jknzi9
zektTn/kSf7AQ7/nof/kod9xepPTG/zabzm9ziNf4/Qqp99weoUneZmHfs3ppWT6SjzKi8n0FaAX
OD3PI3/F6TlOz3J6hif5JaeneeRpTr/g9HNOP+NJnuL0Ux75E04/5vQjTqc4/QdP+SQP/ZDTSU5P
8GuPc/oBj3yM06OcHuH0MKcxnvIEDz3E6TinUU7Hku46PHQy6V4NGuGU4PQgpwc4fZ/T/ZyOcvpe
0o1RX/ouL+U7nO7j1+7l9G1O93D6Fqdvcrqb012c7uSFfYOXcgen2/m1r3O6jdOtnL7GM9zCQzdz
+iqnm/i1G3kpX+F0A792PafrOH2Z07WcvsRTfpGHhjl9gdM1nK7mdFXSNYBnvzLpWg+6gtPlSdcm
hC7jdGnS1Y3QkaQLk410SdJVCbqY02Ge/RDPd5DTRUnXBiS5kGe/gNMBTudz2s9pH6e9vOg9PPtu
TruSrkGUspMXtoOn3M5piNN5nLZx2srzbeG0md/ZJp59I6cNPOUgp/WcBjj1c1rHaS1/6D5+Z2s4
reYPvYoX3cs/qIfTSn67K/gHdfNSlnNaxqmLU2fSGceDLU06qVk7kk7aYZcknZeDFiedRaBFPEk7
p7akEwsJqZWHWjg188impPNiXGtMOq8GNSSdl4Dqk84joIVJexNoAac4pzpOtUk71gXSfB6al7T1
IjSX05ykjfajGk7VSVszQlVJWw+oMmlbBarg18o5lSVthYgs5SlLkjb6YLOTNjogxTgV8+xF/BMK
OUV5YbM4FfDC8jnlcYpwyk3aqJVyOIV5mdm8zBAvLMhLCXDK4vkyOWVw8nPycfImrX0o05O0rgWl
J63rQG5OLk5OTg5Odp7BxjNYeaSFUxonMycTT2nkKQ08Us9Jx0nLScNTqnlKFY9UOMmcJE4kPmVZ
H6CYtAwGJiwbAp9Afwx8BHyIuA8Q92/gX8A/gX8g/u/A33Dtrwi/D/wFeA8YR/yfgXdx7R2E/wS8
DbwF/DFtc+APaVsCvwf+E/gd8Cbi3gD/FngdeA3hV8G/AV4BXgZ+bT4v8JK5JPAi+AXzUOB5cyTw
K+A56GfN0cAzwC+Bp3H9NOJ+Yd4e+Dn0z6Cfgv6peVvgJ+atgR+btwR+ZN4cOIW8/4HyngR+CMSn
TuL3E8DjwA9MuwOPmfYEHjXtDTxi2hd4GBgDTiD+IeA4ro3i2jHEJYERIAE8aLww8IDxosD3jYcC
9xsPB44aLw58D/gu8B3gPuBe4NvGosA94G8B30Seu8F3Gc8L3An9Deg7gNuhv46ybkNZt6KsryHu
FuBm4KvATcCNwFeQ7waUd71hSeA6Q0fgy4bNgWsN3w58yXBf4EolN3CFUh24XKoOXNZ9pPvSo0e6
L+k+3H3x0cPdxsOS8bD/cPvhg4ePHv7N4bhdYzjUfVH3waMXdV/YfaD7gqMHuh+RryKb5Cvj87rP
P7q/W7XfuX/ffuUf+6Wj+6WG/dLs/ZJM9lv3B/crpn3de7r3Ht3TTfYs3XNkT2KPam5izxt7ZLJH
MoxNnTy2x5/VBI4f2mO2Nu3u3tm96+jO7h2btndvww1urd7cveXo5u5N1Ru6Nx7d0D1Yvb57oLq/
e111X/fao33da6pXda8+uqq7t7qneyXSr6he3t19dHn3surO7q6jnd0d1Uu6lyB+cXV796Kj7d1t
1S3drUdbupurm7ob8fAkw5oRzFCs9AaWZOBOiF9aONsf97/hf9+vIv6E/6RfsVt8AZ9cYPFK9R1e
aaf3Eu91XsXi+aVHjnsKCpss6b9M/236X9JVjnh6QXETcVvdQbfios/mXrycPtsxd10D55IK9qwB
dzjSZHFJFlfAJTf+xSVdRRQpKGEPyQpSdMgzKrkCTcoP2LaSmkjS9WR5tH1MR7raE7qlqxPSNYnc
ZfR3vHNVQnNNgnSvWt0zIklf7h2R5PrlCWd75yoevvLaa0nmwvZE5rKepHLXXZkLe9sTR6iOx5me
opogSW907d79e6M98fnE9obtfZviesL6S6tssUgWy5RFjltw85a0QJpMf02lKfG0kqomizlglumv
KbPijpsRQ02ZZ1q6vMliDBjl7jpjh1GOG+vqm+LGotlNn3rOY/Q5+SdH963dG4XcF2X/EOqV9tMg
fnAF//buQ5j+B0KY0Cuf/8OTId26vfhhxfDiPz/L/wdXpP8P7vF/+S2OEHSRngVT8hXYy7wcuAy4
FDgCXAJcDBwGDgEHgYuAC4ELgAPA+cB+YB+wF9gN7AJ2AjuA7cAQcB6wDdgKbAE2A5uAjcAGYBBY
DwwA/cA6YC3QB6wBVgOrgF6gB1gJrAC6geXAMqAL6ASWAh3AEmAxsAhoB9qAVqAFaAaagEagAagH
FgILgDhQB9QC84F5wFxgDlADVANVQCVQAZQDZUApUALMBmJAMVAEFAJRYBZQAOQDeUAEyAVygDCQ
DYSAIBAAsoBMIAPwAz7AC3iAdMANuAAn4ADsgA2wAhYgDTADJsAIGAA9oAO0gAZQA6oFU/itADIg
AYRskBAnTQITwCfAx8BHwIfAB8C/gX8B/wT+Afwd+BvwV+B94C/Ae8A48GfgXeAd4E/A28BbwB+B
PwC/B/4T+B3wJvAG8FvgdeA14FXgN8ArwMvAr4GXgBeBF4DngV8BzwHPAs8AvwSeBk4DvwB+DvwM
eAr4KfAT4MfAj4BTwH8ATwI/BE4CTwCPAz8AHgMeBR4BHgbGgBPAQ8BxYBQ4BiSBESABPAg8AHwf
uB84CnwP+C7wHeA+4F7g28A9wLeAbwJ3A3cBdwLfAO4Abge+DtwG3Ap8DbgFuBn4KnATcCPwFeAG
4HrgOuDLwLXAl4AvAsPAF4BrgKuBq4AryYYFR6QroC4HLgMuBY4AlwAXA4eBQ8BB4CLgQuAC4ABw
PrAf2AfsBfYAu4FdwE5gB7AdGALOA7YBW4EtwGZgE7AR2AAMAuuBAaAfWAesBfqANcBqYBXQC/QA
K4EVQDewHFgGdAFLgQ5gCbAIaAfagFagBWgGmoBGoAGoJxv+lw/T/9tvr/d/+w3+L78/Qpdl0wsz
erOedWtx4En7DUImb5x5AIosJdvIXnIE/11FriU3kifIb8h6cjnUreQuci/5LkmQH5KnyEtn5fq/
DExeqN5OTMoJoiEOQqY+mhqfvBcYU6fNiLkRIYcqeCZmyjr13jlx703eOGWdHNPYiYHlNcvPobS/
SxNTH2HK1RDzVCUNy1dDW9gn/VX7jckHJ+876wGWkk6yiqwma0gf6ScDeP4NZAvZCsucR4bIdrKD
hXbg2mboTQitQyoML0yfSbWT7CI7yR6yj+wn5+O/XdB7UyF6bTcL7ycH8N8F5EJyETlIDpHDqd8H
WMwhXLmIxV6AKxeTS1Azl5LLmBLMYy4nV5ArUWtXk2vIF1Bjnx/6wnSqYfJF8iXU85fJdeTz9LVn
XbmeXE9uIF9Be7iJfJXcTL6GdvF1cvs5sbew+NvIN8idaDM0x1cRcydTN5NbyGPkx+Q4eYA8SB5i
thyEbblFhF02MUvvgg0O4Zkvn3HH3JoHpq11MaxBn3s49dwXwH6XzchxfsqO1HqXIyW1znCqHmgp
h1MxwhLX48m4PvOc1Eb0Ga476zlFjv8ulj4xtdPtsJewDLXZzYi77VOxM1PM1DeTO9AD78ZvalWq
vgnN1Z1Mz4z/xnTau9i1b5F7yLdRF/cRqgTzmHsRdx/5Dvr298hRcj/+O6NnKn71AfJ9VnMJMkKS
5BgZRU0+RE6QMRb/X117EGPHuXmOpcpKTpfyMHmEPIoW8jg5iZHmSfwnYn6AuCdSsadYKh5+kvwH
OcVS0atPom39BCPUz8jPyS/IL8mPEHqa/f4pQs+Q58ivyEuSGepZ8if8niDPqH9P0sgCnJV9BLVx
O1mL//4f/qh9xEXumvpg6sDUB0oL2SQtxwLyftTSKPkSPBM7zny0FCAG1e+Ik4xO/UtZA86feEW9
ZfKbU3+Jr7rqyn179+zetXPH9qHztm3dsnnTxg3r163tW7N6VW9P9/JlXZ1LO5YsXtTe1trS3NTY
UL9wQbyudv68uXNqqqsqK2LFRYX5kdyccHbA47RZLWajQa/TatQqBevzwsZwU38wEelPqCLhlpYi
Gg4PIGJgRkR/IoioprPTJII03wAunZUyjpSbzkkZ5ynj0ykla3AemVdUGGwMBxOnG8LBMWlVZw/0
tQ3h3mBinOnFTKsiLGBGIBRCjmCjZ0tDMCH1BxsTTedvGW7sbygqlEaMhvpw/UZDUSEZMRghjVCJ
/PCuESm/VmJCzm+cMyITnZl+bELJbRzYkFja2dPY4A+FelkcqWdlJTT1CS0rK7g1gXsmXwyOFJ4c
/tKYlazvj5o2hDcMrOlJKAPINKw0Dg9fnbBFEwXhhkTBRb/3wIAbE4XhhsZENIwba++a/gApoc61
hoPD/yS4+fD4n3HXM2IGUjGaXOs/Cb1IH3HaTAlpQGiCe8Md4vlCIXovXxyLk/UIJI509vBwkKz3
J0k8Fu1NyP30yklxxdVNrxwRV6az94dh2cZwY3/q3/lbPIkj64NFhahZ9i83ocrF9WBCifSvH9xC
eWDjcLgBTwhbkuU9iXgDRHwgZczGkdkxpB/ox0NspWbo7EnEwrsSzvBCbm1EoJDcxq3LelgWHtuY
cNYnSP9gKlci1oi8aCKNw7Ri6A3SssKdPQ+Tsqk3RsqD/mNlpJz00vtIuOtRKZHG4Z4NmxKBfv8G
tM9NwR5/KBHvhfl6wz0be2ktha2JgjfwcfhBBbJceLZzUovEeOyENlcX7JH9Si+tLUQEm/ArvHAe
LlgTGh6kNbpwXrBH8hORDJ+SSkHVWeUgoOTWtyAzGFnrW/whNG7281/ckp8/AG4joZu+JxVuQn3m
nvjnfO6t8dT0hgqCjRsbZtzgWYUiwG4wVdpn36dMbZEyBm5BR6uzhT5DUaEMHcRlXULGc7IoWoue
YIIsDfaEN4Z7w2hD8aU9tHKorVn9ti8LU/cqq+1UK1l+Vohfr+bXEiTUvrxHBKjnKdEUZfVKq5WF
m1l4OthyzuVWcRnjDlk6PLxhhCi5tCn7RyQm1PVf7E10RHvDifXRcIjeZ1HhiI6YQsv769F7mzBy
hpsGwkFrsGl4YGzqyPrhkXh8eFdj/5Y56BfD4dYNw+FlPfNQuWwgOOy/iN6LnbRL7csXoiiZLBwJ
S9d0jsSla5at6nnYSkjwmuU9SRm+5v6FvSM5uNbzcJCQOIuVaSyNpEmCNEBL6kJAx9L7H47jCyHs
qopFsPDgmERYHE+EOIkMjsk8zsrSjUTYB8Xx3YnBMRW/EhclqBCn43FHeOr8VGodrljplUcIJhI4
/3DP/Id7AuMGdVwX18dNslmGSWmVJBHzCNLqJXLMJJkl/wjKxBMgGlvSI/q4/2FWEo96RDqClDTu
CEpPJZMJTTajIHwkf/BuUOoJulf1HDMRlM9+I8VC+oMhxLMFbQwTTWNwA21/h3q3DPf30tGDuNFW
8U9KSOFakpDDtbhjjSlhCG9cmDCGF9L4Ohpfx+M1NF4bXpiQ3BIqewyD7nB/GAMx+lQPtjt60fyt
tHvLucGxqanlPaHT/vHeEPr8GmBVT0IfxUSnzm1DumaKfkQ3J44MDtD7IN0Yy+jQ0zrYi84uCkSS
1oQeJehTJSBFE8tD+xsyDaKtoUGy/EcQSBzpTfRG6Yf2bKV3FAxaE6QlPCehifAy1RH6QbHeYXu4
lPZcJE0Ycq+mpMe9kWU9PMaPID4MMwp9Iq0Jdz4YxqXB/iCsjjayDH2ZTxYG2g4RsxFjviqykcHg
T10k9LGUXKPZkNAXo0D8o9pYjALxT9sLo9CHZ6GrUwnw2daEEXcUmWHKVAZYB5da6b3g39W4eZr0
h7SYzjHSFb4AYz+9afZRWlxOmHNbBzC78fxGxISrRWaUpculUbSMUzxWS5/cBLtjSBibui98IR3i
xE9RYZjOfrT9Ef/D6Kikd/jciMTqaFGh7txYM4seHtaZPzsDt5fOPM20FDzIIJ3WwLTBsfYWbKQT
bLhtRF6CFGCJ8XBbGJOanEuBhY6C7hMKbuilqXDLS9lYFv68RChiOhGdplnhw9a5dFVCQ7jOQgjg
33Bi89nBLdPBJlxuwmIwtxhg/yKoGDrub/MnhtAycZkloTUSHA5aw3PC9BceVUFvAPpRT9PdAs0f
rY52miODwZ71aOwwT1P/cNMwPiQ4OIBstA2mPimxI3pWkegXEvohDEKtkDiyNNjfG+zH0lTq7AmF
/OiN4OCmgUQ8PECngqX4fPxbiikJNDBMmzjpxYf6E1pMTJsGNoZDmHAQ18vsyuoHn867DfEPD4eH
E2wgaEJiFB9Bt2ulhH+7ouGBjXQJjc8LDmxkeZtwu8w69P78jWH05Y24W2p3PBe+/UXW01+Dw2GU
1tcfhSVsw/bhYM0whuA+zB6qyOCKfkxVdEYKsqoe8CMEu7bSUC8K4gn1uTQh7wL0brZHR/q0uWdi
aF9M7IzyxDpWKu6sqyexVGRi/Ymm2h1NyOnVuIg7TUhdGNlgfzpOwXjq3FaYN46m56e5gwkZ0yuv
Hpa/lWbF0MArjGdDDJtEWBfDJClmGzEPrfHDpp8bT1RphMBdT1R3k7BqFblf1UAGVH8m9ytvA98n
96tNZLXqE3K/rAKuJVpVPuL7yP2al3BtFtJns3TNqmGSrc0i85UXyBpVOblVWU9WgfuVj0mfvJvk
qo6SXOUUqaDXsHVwpfItxrdqNpBbaZyqmqWnul/+GfKHSKf8AAmp9nOoHeBycpNyB8lWj5EK5QAp
UO4k2UoB6UV5RM4hj2JD5Rall1wDRLEh1ohBhm1cg03wae0Bh7D8tRE3ySAekk6iJIAUMjEgPpNU
4h0yQvJINvESPwmSML5ZWQZPmEJKSS6ZTfIxSrvwfctyYsYbcQUpJkWkkMwiPnzX1I6vIDpIDtHi
c7LwrUoT4V+7fII8IQ3Jc+TnlA7lLdWgOl/9W02p5rvaKu0NumW6Sf2w4bDhY+Mdpp3mkPkXaQct
cyy/tN5gu9teZf+BY5NjxHm/q8P1nvuO9I70lz0nvV3etd53fE/412cUZ8Yyn86qzxrN+l2gItAf
eDKYG+zEPZDJvcpz8O4puJMaspgsIbckroz2PIa5vQuPPUc6ftzV0KAr0j4u1ePBg/Dd67CtXx+3
qGTzCZ+vLnyiQnOtYmsdk4pG67TXYleqbuL1iadjE6+P22ti41LstTdff9P616dtNbGyN59/swSn
FJw+84khZK0InxiqUDTXDim2Opo/rh+qi8vaa4dQiKcu6ns6+nQs+nQUxURnl/RKtpCNwZkma7VO
TTi7WK7Ii1SWlZXWyhXlkXB2msziyiurapWy0ixZQUoeUyvTsKQ898kqpWNCI18crltRps7yWZxm
jVrO8NiL5uVal63OnVecqVW0GkWt0+ZXLcxuH2rMfkVry3S5M+06nT3T7cq0aSd+o0776G/qtI/r
VUMf36Ro5q6py1G+ZtDJKo1mLMvjnTU31LrC4rCqjA6rza3T2m2m/IY1E1e5MmgZGS4XL2tiMcwZ
nvpIdbHaiRYUIa9Suz9McqbeHjVZpUXhsZSIjE29P2pEjFEInD95P+6jUblW+tvMfpvY73i+lEsv
FxqlxTnhSO4/TEaTJzszbDBLbpWJmKwm+cHwE+FfhpWwKWyyZ3bZu9XdpK6uzl5TE4v19dnSa2yQ
tjLreKmtrGS2FO3j7ngcWvDHs1CkKfcfQzPLnFmORxQ0XUwUpaDyct1uDauxPCWkpCnh7Eikskri
1ZSuDSvotjrJmhsI5Dr0qp0Tf9ymGBzhjMxci6STkiqzNy8rOMuXpjoo/VZ6cr7bn6ZStCa9NHfy
Kb1Zr1Kn+d2qpDFNpyg6i/HaiYNozfdjhJLQrrPQZ6vJv6lt476AxyotDlgt9JcZvzwm/ArCUjhL
XRzP97niuO6K47rLZSykiQtp4kKauJAmLqSJCx+RS+HtPnkcmkTKUE/HkBL8/jEkZoz04H9hCU75
7WNIWTYmW+Pmu4wnjbLRl/ePkhJtzpiEM26d5WOScUS7nNSN17EeUyPF+t5kNi99PsoF7QHRGq5p
BzL4SvL+MYQirLSM0SFrp5aWkhxCMeg4dazL1NA+40xThUPZkQpbeWVZCF3ARTtPliKVF8vhsI32
HMcZqZIC1R2Du1snH0gvKEiXIvtuGix1RxfMqljTmD854ate1ZY8Vd9V6V2S23xe59Mfze2pj0h7
52/uqp3lCuSpLssLFC6/aHHx8uZqu6Gia4csxRZVZEz2hed2TLw2p2deYLI6o6qLjrADU++rTOos
jDdsrDmWQeZGU1YEMyuC/3wMVgS/R63IrsOK0cflMoylHimGETgiFSYdy1SPSrMwuM6Wikf0KzD4
PD9OIcW4uawvnoLFRkIeHK08NhRyRMakwtEhx7IK1Zg069hQhX72mFScHEJOGO4UTHeKjjW5zjQ+
vpSzkUNDzUZHEjrGuJxZGE34iKIyyWqdM77uYOvFP79u8bKbn72ketuqJr9Orah0Rl1aacfujhXX
bqiqGLx+9eK9neUWrUGjnLB67GnOgjz/8nv+esfdnzy4xhWc5U9z+OzODIc+L5bXeNUPDx38wSUL
IrGIxpaFiYq15evQlu2Yfb7GWnJmXUhy0PbpoO3T4YSlHHaYyeGBjRyP0vZJfLxd+lIWZYx0YNYu
waxd+h6VbZh/PJIpmdbpH5MiI2reFoUFnxftrs8/kgYzmkaH0jrVNGVyCElZe+NNTT6rqWlnNKzr
Vnz7/Xsn32PNKvc7b9/Rebx85/euenDk0Pf21Mi3fefjb3fxBrTyW2/fuvX4FW2f2GqP/BAtBb1Y
OYQnLyQP0Oce8eWl2gmYtRPGeCoweyp2HTbIG5Ntcb3eEXQE8XC+MUkXNx+JSCcj0jMRKRLRePEc
SXNnHmhEM933+nbvQcOJsaHQyh+7lLaeCCvAOIQW51aQ20yzjw6ZOzW0gOQQShDdDk7jVAM62xqs
BYVsog+GuVQOqQxm3cSN1DDyJp1Zp1bj16RGSuowrqn00EtkSWc2qJrtfruOG0ln9zvtfptucpve
muGw+6zayRKdzU971v1THynLYa88cjmzl9aRsheY2YsxbS0pe7HrtM3AXsfNmSQrU4snOuZweDVj
Uv6x7E4vnRxSM3nslC01CDGrOGjS40NIm00Tjw6x1JgCpmds2mvOemYxIYvhSFmO59dOomK0eEam
4zpn0OfJdupgkSYWe8qRgYdt0Vr9Loffpp/4g9asVavxS/VAXgCzMp579dR7qgvUQVJHXuP9IyPD
4qH9w0P7h4eO3x4D+ofHimf10LZhJk/kScG8eF5/npJnSVkJzKwEZqMPmI0+7DpyWsbk0tFYuVSO
bmAYzc6uidU+KhmwijJIBcmaZU6MLSMxjEFsBLLx5U9qLH++r+8Ub1GIpm0qm5bx0BAtRF0LeWxI
XWMYkwpGh2qWxWhJySEUxZrVqSgti62BPjUOVVbZ6PhOxynWtmx0xKcrIz5yqVQXqHQmral67eWr
zvve+XWNF31347yDFZPP22wqPWbQrxvddoN9zpr1G0pu/vO3VvR9d/z6tss2NvoMqrWOTIcuUhxZ
Mvz4zkMnr2jIzJQuzM5BBeh01gz7pMMXycz2mPruf/+m2z5KDPjCBb7sVAtULcWKJkb+SGtitK5E
CptS5gUz8zJGlYBZp2XXYV4TrZiM9BwjrTkjrTkjrTkjrTkjHdmMdA5NJ3EXJt64g/6y2qRFJI7r
JJ0eWMUFyg/hWvqsLkyOhXHLSZP0jEkynb3WifXtHq+TMKs+T2faVFc/0+X7/MdmdZl4/iFiQq8/
k5+vcWK0o9fxqYIvMrE8PdO8+fTgQhyvB9mlWqpzhjy+oFM3cQzKS5u4zpnt8YacOnkxa/RQPlQW
2rZJJ9dOPCm06hWhJj6SNUKnrC31wNouMkCtfaIO6/4H0xWSMjiYGZwxLAlmBmfXYU/yCMZ+w9TJ
E7CbwdrFFoIwypkB/xiLxBOf9aDikaQe8SB6VyidPsj07Z+5ZfRO7dR70u9xl/nkIL1LuHH41PQ/
ur1M3J5NWpyZFu7SPyqV4qXJg5lenZrpMVpP367/WLjLocf3Ko4NOdToXZjWkYxP67h/rIVoRWlS
PYPN4VgXpWpK+n1Gw86ujKribKNWLSuYvXXecHEge3bQyh/SoZeaFh9ZVaK32Ewmm9fuxquAxW6x
FXcuUL6BClPRfibG4A/wtGXkCBuLbCV00JlN22+MqhCW72zFSJfxdMXIGLUDZrXDriOhgXYHkyuv
K2Sw+rusZ9bpaLjTkxNarz9unJkmtQY/U2WRSJ70GU0ztfp2OTVaSXK7lQ+0zmx/uNCtncwR1Sra
p/QzjTU95PMFHVqzfXKZ9LRNm0EnK43VIF89ceH0eHymnf5QrtObtCo1bGL2pU9MTdzmc6Tm83bY
xsfb68PExU2BU+fMFIxhCjAzBZgtUlwwxSjRW7pcY1I0NWFLsdOiofqPWbo09NL0VCzaK1/7TvdG
+lLYjmlVP3EqvWD66Z6hLxHtTr9Djwn2AdG/Pr5bb8vgc6omijl1HnmR1ae1v3ZXrWyePTs9FjMU
ezxsIYUBiy2wUJ2M8Qxg9gzsOqrTR6szK6fEZDLQ8c1AxzcDHd8MdHwz0PZhoP0RbxZxLwIkp7LT
6Ek3xzwlxZpAfmegW7yq1dnxklaGViDeD/COJcYuW5mtZn6srIy+u/XhVfszy6BNJFWIMBSdMmxh
ib6aFct5UnhGg6Fv2FlyulRGWwyVLk1U5wx400MOnTxZphhdmU5XltMoTzZLGMe8HjSTQv+W4Owc
j146oJauMvoCEe92i99hOjM+bP74Jq1Bq6iwIsZr9K3C6Kp7Z+WYfPn+T1Yq92bN8hr1jkwXrwO8
J9vIfHIvrYNjeRaLM9WLGMOUjGFN8Pv0jYGFYUYnM3uWobi4lJq91IO0pR4kLLUiVSk1eylNYiVZ
1V2GYkueykvXMXRRyGxEzZzqbWesHIN1/fG0czKwnpdeM93zuCnR/cJut+szDJqlpJdF6LtZqn2q
Lja7fOYqX1447JrcElyQIcuyzhHweAJ2XaGvKzMvkGmT5mRWlpZ4JKwKHQGvO2jXNTvhWDBmlubJ
b9Qcnttyc9snf5/ukN/LzzakFwQmflo+2N8X6zjaIT+O92YsLDFU4b0Cq8WfoGVnkAJyJ7XrSI4m
ZVUw65CMYSwwa8zsOkymoSZLt2VSk2bSlpxpNZmlRZn0/TgTq6QkseXSRY1GYwrjzfSYq9M0YyHJ
DSqaLF0NaWjq40NI7qLpR4dYBhj0rLXk2a0S6x3VjJcM5SfxA9+/4Ea9I+SlU9Esn+SatXjr9kUF
x+eu7Cu88+tLNjflKDcO3L5j3mTxdHODgbTpdWsuXNmxrTxt4sP85kG0tuapcWVQHSKtUj61ysNk
AVwxFjhaFlCrwBqM8eSM0YrAbJhaMCYXxqOlcYdTWlQax6yVU5pTavJ7aF4/7ep+K3L5acPz04bn
fwRH0NHfj/nZ3HzymDfFTs4PWejyxlT8qJSHP+FmkCJxoy1YJVXFjSZpkY1+Y8VAVZWtyuaeRxfj
C/zqgmVurCLZBDlOnTrjNurYiUb7rONWvNzMWO+w1xyx+KGVUFU8JuUlh2xYhkZODLFSC2ixJ4ZY
uWpasJhTadHRVNFnJlfVWZNr+fRke+4LtEYZrD9wd9+CnSvnphsxcerSypbubqvuq88p7dq6Y0tX
2dytNyyPrlw8z6FRyYrGqDXGGvrmVC4t95Uu27Zj27Iy6bzVX4ZzIpjtyQ3AOafNzg9nVS0tq1oy
t6Ssdvnujs5LVhRZvAGH0eZx2PFenRHOzJy9MLdyybzSsvnLdtN5Ohu+ty2Yi3LIVWxcz8zRoUry
cyQf5YhPyocLxCwVeqVCj+RFDbMmwARt6h4RQ0XcTqO8Hq8nkhvo8qjtfC1lr6mz2SVu/2i0ZDbp
65P6+vrgUvOfmE6GRo50dBxmg68qD++nlZUzhtxS+M608glVmjcv0x3y2ExaZbJXJ9nzszNCdr1K
2itJWxWdMycrkGNWdFnUDyZh5jXqVEnmKcPr48dPqOpoPPWU0WefP/WR5g08+zwyzMbTyDypdGzq
g3g9bU65pVJMR0V+TIKDkcbkStkeKgqyJU+QiqISqWi2VJQjFYWlqq5ZXeHZRmWmMxGjYB0mIPxQ
B2LqP3/ccm5aMWSeeX46+TAPIZ2GzrXE9DTEbKK+XGXNKMgKRDPSVJN/lT9S0nwFwVBhhkWZ/J5G
skWCgRyHVpbCkuRU9M7crIyQU69IBbKUqWgc4cyssFVSR9JsdDy0pSnPfhITWnU0Hc5GRZdm/PiU
ao7RQhd3FuPHP1bNNUCr03zpGD3XYJSoU36GdV6c/Iu1oKBlYWBhbKFi1KeXm9DHy2mXL6cdvdxK
hwD46P4dx8t5noVIJkJHTTInNVuB36YjC2NkoMza25wxWRd32tJ/RMqt5fLck+USwftnefGCWWMS
7PlMtpSdrcp8p7ht/qumxSoSS3kR+8ZteGXs2722T3jCTkXX9tXE+JhbWlMyey1WB2ZjulSe/qMh
Wl42K9A9RLLhKEaZxZnvDBW3mea/OkTL9cRSbkX62kOLjvbRFuukTl1MYRXcuct6f1kFdfxMO+Nr
VWzJoOWuM3dZaWWVUmfN8PsCaXNv6Gze21lUu+87Ww+5S5bUzB9oLTHpMD9p/QtXbCofuGZ55J5r
GzYsDPQuXbBzvsdkwvRgWlXXlNu0acGiXW25TeVLK/yZ4Uyd1WvxZvrCmY7C7ouXn0ovqitoWraw
AXV0K+roBfVu7LnMJw/ROjpeVycZQpWp2QzMxnMwG79pmFm9ckz6IO53RalPLRpEvURpLUbpbBel
9RYdkw1xPXEZKitCKjVciOqHIm3+JuuiGsgR9WLqAqBuk3Q4c1OrhzOW7/Of4PkiNCM2PXhWNc2L
4XUxe+mnM196yoXL3i/zhA/yzHrBxv3nbA6EvbU2N8xbKysvlA1e3xdtbWrKg6vIheWBRusIerxY
K+S3t7Tkr//iyvwHXOUr4sHaeGNew6H62p4qr/TW/kevaLJF5hTswOSoUuGNRl2NgZm+1ugm/lBQ
HbYuuTyxv/GyDfPtsxaWTt66bOW8wYN0LFkFGweVp+CC/Sm18EgGXutOUo84+A3apunb5ijMR5hz
DheY0w5WBDP3yhmn3dQ7NAOcd8a4OZYmpXnfCsQN5pYA3sTlUUeb8m4Jyh7Vm1tKCsckzYgehp54
PkrdLVG085Sr5RTeiaiDKm4KeN8a4gU4aAknhhxtJcq7Q7SQ47QQPS0Fzl9mcmSj3t/Pdv8yb3A4
G/NY1rTzVwnKaq13XntPbODmjRULdt/aG+1sqPDoNbLdbMmb1z3nwCWheN+8mhV1URNd637T5rWZ
vbmZ9vjBY/uvfOKiuVZftifN4bHnBUL5oRMPrLy8J5oTDescmWi5/bDq7TjHH4GX/DE2ugTq5kpG
fw0dU2roG0MNXUvU0NZYQxtnzaP4shchMW7zGG3RuA5m6zjGyMTikTpGG7DBEWoy1uT5VWno++qk
pw0DlOpY2mL1IurzY813+lVTrIExcmDgMIiMHppzdMjTlkbzwjNMM9NlG2u+0yth+nYxc4wodadP
r3rhUJ3pVq9SbtfaMpx0t6z51tWDX1qZX7r+hnUdl8e1zgBtw/p76w831KHFogUvCM2PN+V5RYM9
sHjF4stH1u979IrmxnrZKFbBE41oq+sPxRsu24i2W18C6/bBurdi7I5ib/YdZt1Zscq6yp2VioP2
dkcQVnU4QoV0pVZIrcu3gNgojjbz4fGG6D1RmW5WHKejQbkq1dTBrEWzMLKB+TCuovYOhQp/ckR1
vUo+qZKeUUkqVUbs1Uib553+tF1pcpr+nQzWnPv4PhD3RbM3j9LXorxp03EXywhUQLaq8CdD57My
IrFXMYKked4ZImlWfMtZScvQvzOEsqjng3mp6BqaeaUl7JqGZrRgDCkztzlkV14lqwutcmuedyKZ
1bSrM76hNWbSGjWKrGiNlSt2x3fet2fOvN13DW77an/RvcqFB+avqc3Ge0peqP2CFcUun0ub5rWb
HRaT0etx1F40dtG+hy9tbNj79R7HZTcVL9pYRUeMXHx/5Cr1BVh9XENtn3Rb6VDBhgh/akSmzEZi
CPbiAWZDNPYdPkzOnoU9zmfidur9yzWMVzb7IuOzW4KLrC30pW28tA6DQfRU2V+pb+9UtIzuAMVt
lYbxIaScHRkfSqWli49oad2nHKsuNmPBVjPeNzDNidmNva2p5KuwxtJoXVkF/tzyYNpTOqNebbc8
pcNIixdg3SVWKx05Lwm3bG8LL8wxYe1lcaSnqfVGvaesc856rc3nyAl+8i5dptG9IsUVzHH4bNq+
tVevKDBbTA7mz4elVCfVF5IBvkYdbW7OXoaR7MNksQmL8Q/jgeXZ9mw7qSkr1o2val7W0jFe1xR2
x8ZrWgoWZSwyMXPAHjAIzCLFTpWdoovRsjdLrW+WYkOe2iVjlW58iOat6xgformxaT80nZ+aCDaC
kUCY8WkLQmemI+FnWWmGC/Qcg7nTsxS4mqYzh/ibAo1WncQeiCuQ72ub/xSd/W3WaStODp1rz5yW
85oLF7oMMCjNFUSuedJNuYiN1rv0Zq2itgYzUBebdg1+2sSfNnd335UrCix6FeztCGaicjbtWjlw
Jg7bT6Ri8kblC8pPSS3ORqyT3Gy0cNmLmunI26zDANEctDqkRc1ldVhBU88DmI254DceopfqtB2Q
cbPFLi3q8Ksss5UyrZaOGBig0a5Pxs0QRWVav19bVqSifSFejsGD9NCP6Alaka1nVm7cCM61zNYq
1W2vmJa97XL1Vyt/mtcyK7jw5eq21S8HO1JbyHVs7Tf+Il9+RMtO006Qjnqnr4E2rCqsp6P4FxW/
aCvIY+Wa2l4ZMrlcy94eooXPU/40RIuvXvjyUHVbcPXLQ/iI1D5XHV8EWn88vUpBb4GXg/lYI3ka
TJTudFblzOnKtiOqsFDE2Qz6m3Yhd3qo1C3xcxtIzfeiI3l5aWgnfB3zBYfl0nBGad+RJVWDfnv6
gsp363d1FZefd+/u7beuL7SGSoIlsdLcQE75mksXFTQHJKvNNjm5sW92cyx94+qSllj6snWdfwoW
ePRXnN++sdav7AsHclbGllywrDDTbS/OChfLBjk0v3du7a7uktx4b3motrrM611UOL8/ktu3cPFF
y4v0utDkX9dsDla35vduClS1TKydUyfrvEUF+a4F9Zmza+lodiu8KHdhjVlK7qBtY7SuXJp1Zlst
NYzN2G9jK04HXWCmZ/GtDTql8/0NNsEY6TUD39WAD8yKNcqJoracJu8iNjHTdSWWlSm/N19Wsln5
2CxvEU2MFeV0ct5/7XQhiT1ttpDE+pF1YO0Mj1TKAWXj750u5S6dnS8YPcWts2sPNSDI3HpiHdl8
feuqg4tCXjF6yZbFaxtyeronvihiZi4e21vnb/rCAN3JvnLqI6lTHcN+RYjcR611oi7cEd4ZVtx0
eIcZwGy4Z2Hs4oBZNwGzPsXi0Tfcj+KMWAbcx8yan3YXp8wOn/AHDxkC9EQH/lhR7ajX2sps+OJ4
NOVDT61r2Kw64qWJjg/xVDDdj1OLQWG3lJkcdByjbRmNWKo91zaOwrlzohTT1lGuEPsD0uw5swpq
gFS7OYR2U06OsTHFVFcpFZRIJXG7tBgr1GfY9AfB1tDgd+jYwsJ4/pJH8UcJsokp9Zyfv6OGpuRz
FxURagLepNzZRnV+a0aTTTQneHIwNeCASczKZszSN+i8SS2ChYZxZmrWmpB8Rmv6H20tHNI5sn3+
sMeimbziXHNJy3V2L7bBsjF6WyYfkXaYjfAS63DAx6yX/jZp/nSD+uQ56XyDWa9gQaI3eayTj0zm
2lypnijVwqIu0snbFnbDdrLdMNZKMLCytkXfR+iJHDBfYxC0klGDtYk1jVS7oKusYywKDz3jec+8
fX265qcr/Ezj5/WsfgZrzaVSFqtnv53uArGTGhHmXcljrpVdXVLTjFGC3SHC79NJgjEqEMxekNjo
kZXlRofJyirl+wd0EOGbCGwQMWB5cGIp9UEurcX7FXvwGe9ZrFiEWadijOx5j+JvRZQSK96J2tuw
zNDEzQvaapuKqluLFk0PPqh++m4gtqBqUnsQWE2kNuLoWMT+wo1/pJ0OR6ND7W0LWGlpQ2cXJ5oT
fVs428SfGqA+FZHqiq6Up4y/CbvUz/CBy6FzFjYU1+xtpMsH7FNo3YX1xTX7pscxjT0j3Z1p1S66
rrW6t2G2taizvTln5fmtgekqlMM154xon45RrsBCQ1H0Rt2B7g5fbEF+ScMsB4a6RWJWQK2XkjFW
6xZe67TqUxPEuTWbmhd4VaGmUy2AOiKyjPRdj2+G0zXBzB1x6YMTqamCjf2GorZZ3pxWUV3wLKKq
RNWkPO6pGvKP8OnCiOliOg+tE2T67+rjbPN//oQxbehbFv83E8ZZxoQR++l8QX0Lr8OKDpxoeYrZ
MaOuQMq3SwU26puNmKSITopopVnMrZdFjQZDgVm7BrPBE8zeyth1VEAWfRnLihkkg5N6dJzUpE76
3uek/h4nfd9zPoI/wALP/AkLWbwL1YkDP1LS0oa9CTnl3oFZ+1ItXjge6IiZ+vGPWGiW0SFLm5pm
mvbr8EV0Gp9RUhs/woEjnAvK63P2fn/Pzm/vqKzZe/9ecNUD/tptHa1bG0L+um0dLdsagtIfdjx8
VfvCi0f3gNvAh1ovW19Tvu6yxW2XDdSUr72MWu/WyZuUF2A96v0aodaj3q9Q5WfsN/Nx8MzGM12c
uLjji7nA2A4G94F9puer1drxuZ6v/9rxhZz/nePr0+sU1+c7vr6yNr9hQTxHzDJof06X364tWLS4
s2j9MHV8lTHHV1New0X1tb1VPulP5z92ebM1uzw8WSv8Xao/oU/jMKlRf+Gs2gLXoise3N946YZ5
joL6ksnb8IWzDYdg3X5Y9/aUdU/wkR3mDRijdCSOUg8NNxgbjqPUOzMLX6pkDbEs1UDBbDwHs4bL
GK0PZ0XhnXHlthrnRwMqK7Zl1ElfWzX1zlgXq7HO/2zvDHXrUueMyOejGUeHfG1WmhXHRGledPAz
zpnUmQhs/fKNX74yh5ddCNenvTN6ujQMOLUFbS2tedSkpYM3rMtvamyeRU83OzNs2k95aCZHhWWl
0wU1YYvw0thy5xZsF6ae/Cd303AXI9w0fBSV74ONy1Lvv7sqpIglNZuB2RAJ5s2XCrqGtND1sz11
QAgTIKFdm/gwI+bG9dG2iMUVbHVRFxebytjSh3dkZr6RKEtoGDqTEiajSWd2Xeqx+owFNG+YGvk+
WaPX6dIzc1ze2RVzwjNaI5t2chfMqck0h3IyTSpFUta7s2x6vV7nLF5UNZEQ650z4+HllQ15FkVn
MOjT/LBJ59S4/DRs0ipZWaszxdrr2jvaL2l/sF09Y4OSzfgsjNENfPIYltMsjCGPMRragjHp1XiA
71LSZuunzTa1SYnLfjoy+h/BX46ihxIMCBBTHPFYbp6MR1BenelBk2wqfq3K8K5tqa3ftsum8M3I
39Adwzb329wVDuvxbcjUJiSOlIujC7gUS51m4Z6t3Kri17AF+e4QsVltQRu2glIbkb9hu5Btavfb
wkeOvHwLknq5ZtTO/3gXUn66bO1lS2avbJztNqjoLmO0bkX1rIZSf158aXdnPK+g62BXTsucApdW
wWrToNFnV7bGZsULXPnxru5l8TwprXEI7Snd68wJOHAO0x/028OVuZHy/EB2tHbFvIqB1kKT3WU1
WdxWm9eqdXvdjvDsjLyK/GD2rHnLaQsPTf1F3q76PplDvkBrc7SA2MJFqeGBMWoFzGoTzIYJxqiG
ItrQTenmovFwS6Z5PL2lBN18RMt2H8ZP04m/LHVy4fQp5hBH0eNDSJseTzePD6W3aGkGnBrnWw5R
n/W0mPj5GULbOU4cHP2Y6fVhb+nUVyZv11mDBcXpTRvimRdb7PQM62HxqvgWdenYLW9VNafnZDh1
ar1atToz25qm1+S2710ip3G314viWMKL3Gszaehbpzfo1WmeqSlqI+Uv6hj+BFsBPNxaUiLjL+1w
2ymvwnYLyBZqu2RsAZZAH4xGs7KiGAM+jJuUiuiCFmt0fG5Fi5MOnrmL9dy1fRo+QilW+tqb8IzC
FcYcYWYkrYiOD82NV7Tk0uSjQyw9GzB9p+EoxBpVKp15kgPurmkbwPXx+UZTvpPlxlI03QvP4GRs
hik+327KCb/vk1umRwPXGYvYM0O2zzVfyi6qZ1W/Jhv5aRnYJQ12SUaX9DCfoXmhOQP/kYrocrKk
ZUHL3LnBltktcktPWnS8osVOm0Tu4jUg0ZSoB/EUNg8xvcVOxcpYl6VnYagXkZnOy4shLdYW2ai0
VPSkUUPCjLQwakYtLe5MQ6MeRSv1TdMy+co/ZbtzLMr8hTiXdI7zFc3wzMFKfIuBfq+BeWuna0P1
rM6WVRBzN2+oy5pcMMPgcGNbsvI/u6lKTwhv4x9Zo017q7LZnZvh0mp0tNGGrGmGVKOdURk2p81s
Nn9ea5YkcdRkcurclo0WfBPd5VEem35LCODdwJhHR+I8OhLn0ZMIeWwBkUffHHDa/MOHCH2pI4HU
ZAdmYwP4A+YxoIK+3dIEIuJ9HoEuoXcUteYZ1d5WvJCpz2z1oEqnd3qmh2a+mtCnMqTRHDM3eGie
mW9tYn9nemPHxnYacEBZnG/Czo4905WeadMsvpm9Dmid3FmeHmuZXXuwETs88DLZ9dMvYQe6l8zb
/IX1crZ4z5r4R8e6+tyebnm/iKHtHSc5lIOwYqFkpuPAw/haFdav9JhCgJ1jyA1IWVxkScyRBPOw
k4ZgcUzMkVpN2FNsg/niVUhQhTcNm5RnlfLVUnY+IuZnSznZUohKfAsjJyQFWWxQyglKeRbp/JAU
opsTepurJRTEHInQ23E9Jt0Q3VWiIerIAb8fN6GMUH5ryOhrNfIFCWqBOV9ItI+9TUTpaZG+KD01
kvoeFj1LEfUfJyHJqmYfZMQHTZfBlip1UXQtOljB46edPtI3fSZcTnekVzn4Elo5KMmKPHlaZfbl
Z2Xle3GQ4mmVmp4tS88M46tYkyrlYxn7hP70LJtWuVOlN5i0n3yXHiVR6dIMykqTXa+ghePArEk/
4TOZ5D/q4ZmXdUZaLxVTH6mvQL00SiW8XpqxbJgPI2BjWVpcUC1VUc4tliIhKRKUIgEpkiVFMqW8
DClfJRUo0py50tw50twiaV6hZA3ikDL+4DFzB1LGxjAigijBipUfi6Ycx0mcxRYabVnQytJRs9dZ
O6w7rZdYVda43d1iLWvNbZ1zfaFUSK8V0tWM1eFu2Vx4oFBuRGz6IjZPvEBt3neqru40bM5rhtUO
O8jDj/Lw1z1WJfHMBa0Wa8BKP0pl4p8TZx+0tFBS2IfY8SGRwspCWUZTVfGPQY29gOrqi66jn4R5
Zm0fm2josdzUaUwlTzvjRIxYms+oxRlSfYVKPflvxZyenxWY5TUpP5DlBxWzD6dk8hCa/FCtovNQ
RrZdp7ws43/Jqbejz+F8ofySLL0o4/Ccz4ODzcqdWqflTD3L1+r1E3vP1LrFqdUbUelw0U349HpU
OjZe8I083YRHhGSdAS2gAD2zHS0gRu7hLaAEprah1eOAkbS4mI5pc4slnKB6/yHIco+E0/ts9KLd
lEW5JT3tKbNwmdA884hUHZYqjZIxiC5lpPVsNJbMLmgNG22ZrcKnSccmevKKbZeyU1eoSPqPdiI4
NWcmRwWw5T0dy9zsQAtOHilnvqR45hCSg3UaehpLUup1jrxAVthlVP36JZXRlY3vKtokveSZ/LdO
cuQFM8NOg+r0MyqDLeDPzLXL+skPC9McJjV8llpp4+TXQYra5EiTTkj3pTnMKkVj0E6OSB0gRWV0
WibX0nENb5iHYL0csptbzw9LVMAIVX6pwC95qKMi4pEiaZVpcp5e8tGl+Ryf5K0Gz/VKgVavwdFq
aFd1kHa6L0r9OhhUYAN+CA2n0HBEYmYiagqaCqYIKfxIT5WDHh+PlE+fSHNQ14/b7dTKZRdoSkp9
QZusOaS3KpNP6Kw5WVnZTr1akpQPNLbsYEaOTTN53GpTm5xpUo3KblDWuDxpanxJ0zxRLL/oMKqx
vrPTkaIX7oqX8BcLo6SfP6kVT+qmZ+oi7FxpDGnK9Q16WZ9rgzflmLfFgrkQrhg8GN3uxYm1vtMY
MVG5yVwvTQIvfotFTRPB9dJOt62wh1kq5it6LJz2oyrprC/P0O0rrUS/RyO/pNGl6SZedPnpOCdd
O3mJ1UHPjcsqI87f0bjJ/dK9+JKWpglfidFmhLLT3G6vVd4WysVXs7SaNLctmOZJ91knbsb3luAt
IMoJtvNhxDe9U6dKibx7VKNX6C7t66fhT8U+3KheiSPsqfO9fpoN4DM2GqROsbEw+aDqdGofYRJ/
CYY8OvVv6Vrlq8xLVkrtN0Jw6vngCUNWGH5AC8o/XYcPwLYvPuIhGhdHJD4E0exTznZHTftbUvO2
dK3emx8I5qNve/KDgXyv/tywEgwW+o1Gf2Ewu4hy0UR+iEfgT55gVvAVof5uwV3uIG/gu+8F/B5x
lvjkQ+i/sAEmP9xg9Ie4v2P6OIL05lhlzTDAjljtvGKK7c2x4kaA+riuUQ4oxThL4McB2TAtd1ST
7S5tJnVlp+nTHtdkx2nQU1fmO02rX+JblHwyrEp9UVz7GbGsid9rTA97PNluo8acbr1abbJ77Va3
QVJPpn/GBYwFquaLfUG7RmMP+rLKiou8p3UGLf2qsm5y/HMu0GeIKgfkZ896BmNeetmZZzDmxWnw
zDPQZqqlk0MkUl7lEBOCejq6WD4TKz9L7/0aldnusVtdRuUKQ3rYmx52Gydvm3EBD6ViV+jDqvMC
uHnPaZ0RN4+JXbJdgm6u0diCvs+7gPptlEblYnk+/v5BkNUD0RrHcSBxHN/ToC1bZRwfoucI+Xs6
zqHwHTTW2Yrttsm1dvxI30SXUksf5mUFIpEsjc2H9zw6PtgB+qPBd3/JAvpTH60fGNq6fs/W/wM/
KNGxCmVuZHN0cmVhbQplbmRvYmoKOSAwIG9iago8PCAvVHlwZSAvRm9udCAvU3VidHlwZSAvVHJ1
ZVR5cGUgL0Jhc2VGb250IC9BQUFBQUUrQ2FsaWJyaS1Cb2xkIC9Gb250RGVzY3JpcHRvcgoxNyAw
IFIgL1RvVW5pY29kZSAxOCAwIFIgL0ZpcnN0Q2hhciAzMyAvTGFzdENoYXIgNTkgL1dpZHRocyBb
IDUyOSA0MjMgNjA2CjIyNiA4NzQgNDk0IDUzNyA0NzQgNTAzIDM1NSAzOTkgMzEyIDUzNyA0MzAg
NTYzIDgxMyA1MzggNDczIDY1OSAzMTIgMjc2IDUzNwozNDcgNTM3IDI0NiAzOTcgNTM3IF0gPj4K
ZW5kb2JqCjE4IDAgb2JqCjw8IC9MZW5ndGggMzc4IC9GaWx0ZXIgL0ZsYXRlRGVjb2RlID4+CnN0
cmVhbQp4AV2Sy2rDMBBF9/4KLdtFsGwlTgLGUFICWfRB3X6ALY2DoZGN4iz8971XSVPo4iyORyPP
ZZTuDs8H308qfQ+DrWVSXe9dkPNwCVZUK8feJ1muXG+nm8Vv9tSMSYrmej5Pcjr4blBlmSiVfqDl
PIVZPTy5oZVHfnsLTkLvj+rha1fHL/VlHL/lJH5SOqkq5aTDdS/N+NqcRKWxdXFwqPfTvEDX34nP
eRSFidCRXUeyg5Pz2FgJjT9KUmpdlft9lYh3/0r56trRdrejeVaVROulqZIyz6EAaqkGCqAZdQkF
WueauoICVB21gAKti3h4DQVQYXUDBdA1dQsF0BW1gbbUdU61UIAfbagOCnB4SRUoQLWjdlCg9Yq9
BuEJDnMqg3AEysMG4Qh+VFARjiAChzQIR3DzlopwRGvTUBGOoJczG4QjUE5lEM5cE3FmdERQjb0I
Z2LAAkNiMb8b4I74lu67t5cQsPb44OKL4KZ7L/c3OQ4jL4j8AJR9vf0KZW5kc3RyZWFtCmVuZG9i
agoxNyAwIG9iago8PCAvVHlwZSAvRm9udERlc2NyaXB0b3IgL0ZvbnROYW1lIC9BQUFBQUUrQ2Fs
aWJyaS1Cb2xkIC9GbGFncyA0IC9Gb250QkJveApbLTUxOSAtMzQ5IDEyNjIgMTAzOV0gL0l0YWxp
Y0FuZ2xlIDAgL0FzY2VudCA5NTIgL0Rlc2NlbnQgLTI2OSAvQ2FwSGVpZ2h0CjYzMiAvU3RlbVYg
MCAvWEhlaWdodCA0NjkgL0F2Z1dpZHRoIDUzNiAvTWF4V2lkdGggMTMyOCAvRm9udEZpbGUyIDE5
IDAgUiA+PgplbmRvYmoKMTkgMCBvYmoKPDwgL0xlbmd0aDEgMTgyODQgL0xlbmd0aCAxMDA4OCAv
RmlsdGVyIC9GbGF0ZURlY29kZSA+PgpzdHJlYW0KeAHlnHtgVMXZ8GfOObubve8m2d0km+wlZy9J
NtnN/UICOYQk5EJIIFlIgEBCAEFUMBAQFMW23qKIrVZrrUKtrbVo2Syoi+ClSm2tolapN7TVllat
RqlirWCy3zPn2Y2g7du37fe97x/fmuf8zlzPzPPMPDNzdnHj8MhKoiXbCU+Kh84fXE/kT14LYO7Q
po0uDGfUEaK8etX6c87HsOMwIeq0c87bsgrDeUcJcVyweuXgCgyTz4GVqyECw7Qc6Fl9/saLMOx/
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
qMkN/6TkG/stbqVbjHH98Mpacue1urVZrdqEz6qHbziyMtjJyMQusA148EsZEpNFNfXyFV7FJmxr
S7NVpeHKze+jvEKYPKkw+2dVVszymRWTJ5Uqqs0u8eazd1pPK5W/5PXZIZ83lKXhdykMZqvh81fN
Fp2g0FlMvD/dZVBCVwSF2qybuDAzk9upM6sVgsYI/WqCjdsH/GNwmtyN/ZI0Ri81GY3UrDTFuAMP
ONPhP+KLcQ9H1V5zctibYzRH0mS2GP2ymf0QhMWoHV9jlMLgLwUbH2E+xwROh4BrWtpvl7RTVf8r
NRWXyMXZRMDX+kxFVZS94Ge6Yq/2LfKbP8puuQ/YK/yJA/YcXm3U0bmTh9NsChjPnNuQrlcJKfBy
bz8dUMMB+5yc/Ay1Jz+YmmPPNnNCcUWO36ZRmrItJenO7GzTxESK1Q/r8+74x/Qhfq+8PtvHCOzi
Yw9qHCJsQowtpP5IPXxNWDZeCl8OJl63JA04tQFPGJQ+ZHBX5udXunU6pOHLYd5aUO0xGj3VBYFp
HpPJM22ipaCGRdQUFNQy1rK9Ezf5a36B4jnYZWcegn11B9GCCedGNSYFCYVA62+AwtPwZX7yyy3V
5wpTTsCdX24XlNwCwZRd5CooyxIUkxN6k0aRYso0K3fCK3n5Dp6wdnIXl624gYgk91GSRU/B1DbR
z+CLW57buM/i1F5B6uFBEy/Bl6PQbSV8bZRqs6YnvloL8rJ5cORytp4FC+crrUV52Xl2I1/ZVZFl
r+ys4HQZ+S5PMINX9D4xOfjascmhJ002U4qg0qpWv/jysQvXH3v56Br4/pNXGazQnkFoTyq0x008
8E06tyGaalEchGYZ4dRwep8lS4MNYt/Vyi0CQyS+3iuvqkytKOf8PvSXNmsql5pV0VnJG+152flF
VmX3wgVhBZ9Z5HXmZWn51edxWRcee/nF1dAQIQWadJjuOvYa3fWE3mqAxqQoXpjsBmUwK6SCsI8S
xgWZyT5NgVmD561ZPrymqGHdeex/jPN/AFy3jeIKZW5kc3RyZWFtCmVuZG9iagoxMSAwIG9iago8
PCAvVHlwZSAvRm9udCAvU3VidHlwZSAvVHJ1ZVR5cGUgL0Jhc2VGb250IC9BQUFBQUcrQXJpYWxN
VCAvRm9udERlc2NyaXB0b3IKMjAgMCBSIC9Ub1VuaWNvZGUgMjEgMCBSIC9GaXJzdENoYXIgMzMg
L0xhc3RDaGFyIDM0IC9XaWR0aHMgWyAzNTAgMjc4IF0gPj4KZW5kb2JqCjIxIDAgb2JqCjw8IC9M
ZW5ndGggMjMwIC9GaWx0ZXIgL0ZsYXRlRGVjb2RlID4+CnN0cmVhbQp4AV2QQW7DIBBF95xilski
ArNGSFWqSF60qer2ABjGFlI8IIwXvn2BpKnUxSDx57/hM/zcv/bkM/CPFOyAGSZPLuEatmQRRpw9
sU6C8zY/bk2zi4mMF3jY14xLT1MApRgA/yzImtMOhxcXRjxW7ZocJk8zHL7PQ1OGLcYbLkgZBNMa
HE5l3JuJ72ZB4A099a70fd5PhfpzfO0RoSQqRHePZIPDNRqLydCMTAmh1eWiGZL715J3YJweTtlp
1UpIqZkqRyshpGj4r7FOqj9+JrRbSiVcW0vLXfN4wufmYoj1/VY/bONzGQplbmRzdHJlYW0KZW5k
b2JqCjIwIDAgb2JqCjw8IC9UeXBlIC9Gb250RGVzY3JpcHRvciAvRm9udE5hbWUgL0FBQUFBRytB
cmlhbE1UIC9GbGFncyA0IC9Gb250QkJveCBbLTY2NSAtMzI1IDIwMDAgMTAzOV0KL0l0YWxpY0Fu
Z2xlIDAgL0FzY2VudCA5MDUgL0Rlc2NlbnQgLTIxMiAvQ2FwSGVpZ2h0IDcxNiAvU3RlbVYgMCAv
TGVhZGluZwozMyAvWEhlaWdodCA1MTkgL0F2Z1dpZHRoIDQ0MSAvTWF4V2lkdGggMjAwMCAvRm9u
dEZpbGUyIDIyIDAgUiA+PgplbmRvYmoKMjIgMCBvYmoKPDwgL0xlbmd0aDEgNTEyIC9MZW5ndGgg
MzIwIC9GaWx0ZXIgL0ZsYXRlRGVjb2RlID4+CnN0cmVhbQp4ASspKk1l4GBoYGBmYEjOTSxgAAPG
FCAlk55TmQbldwDpsIzURJA4CPwBYrMMoACYx8BoAqRVMnJLKqD8CCDNk5OfDJNvAPI5chMroOYz
3AHyFfISc1OBNBAwPgASCkBMXcAINI6ZgYeBCWwsE4MAgz4DSAwGQGy2M2cfxrDXx/PbfOWQ5gDL
LHqsrgVinA24KvZr/d90AQaOQCCXE64XqI/d7p8fg7MAw6/1v6oEgB4Aa0QQzGxAISZLBgamswy5
QGFGqAoeBjYGPiBfEegmJqiYKIMogzYDE8gIViAEupgdqEBQUVAVSDAysDD8UWA+8MeBleE3gwLL
AZBZuYwXmDKYTzNwMzAIm5gZG4mJirApK6nlTs3InDo1M2Mq07nMKVMygWygkSD1QlCbwHY7goC7
tmNRZmKObwgA64tAmAplbmRzdHJlYW0KZW5kb2JqCjIzIDAgb2JqCjw8IC9Qcm9kdWNlciAobWFj
T1MgVmVyc2lvbiAxNS41IFwoQnVpbGQgMjRGNzRcKSBRdWFydHogUERGQ29udGV4dCkgL0NyZWF0
aW9uRGF0ZQooRDoyMDI1MDUyMDE1NTIxNFowMCcwMCcpIC9Nb2REYXRlIChEOjIwMjUwNTIwMTU1
MjE0WjAwJzAwJykgPj4KZW5kb2JqCnhyZWYKMCAyNAowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAw
MDM0MTUgMDAwMDAgbiAKMDAwMDAwNjM4OCAwMDAwMCBuIAowMDAwMDAwMDIyIDAwMDAwIG4gCjAw
MDAwMDM1MTkgMDAwMDAgbiAKMDAwMDAwNjM1MiAwMDAwMCBuIAowMDAwMDAwMDAwIDAwMDAwIG4g
CjAwMDAwMDY1MjEgMDAwMDAgbiAKMDAwMDAwMDAwMCAwMDAwMCBuIAowMDAwMDI1MjE1IDAwMDAw
IG4gCjAwMDAwMDAwMDAgMDAwMDAgbiAKMDAwMDAzNjM1NiAwMDAwMCBuIAowMDAwMDAzNjM5IDAw
MDAwIG4gCjAwMDAwMDY0NzEgMDAwMDAgbiAKMDAwMDAwNzQ3MSAwMDAwMCBuIAowMDAwMDA2ODg3
IDAwMDAwIG4gCjAwMDAwMDc3MDcgMDAwMDAgbiAKMDAwMDAyNTkzNyAwMDAwMCBuIAowMDAwMDI1
NDg2IDAwMDAwIG4gCjAwMDAwMjYxNzggMDAwMDAgbiAKMDAwMDAzNjgyNiAwMDAwMCBuIAowMDAw
MDM2NTIzIDAwMDAwIG4gCjAwMDAwMzcwNzQgMDAwMDAgbiAKMDAwMDAzNzQ4MCAwMDAwMCBuIAp0
cmFpbGVyCjw8IC9TaXplIDI0IC9Sb290IDEzIDAgUiAvSW5mbyAyMyAwIFIgL0lEIFsgPGM4ZDhl
MDcyNDJhMDg1MDcyMmM0ZTc3OGVkZDE3YTY2Pgo8YzhkOGUwNzI0MmEwODUwNzIyYzRlNzc4ZWRk
MTdhNjY+IF0gPj4Kc3RhcnR4cmVmCjM3NjQyCiUlRU9GCg==

--_004_PH7PR84MB2245E09020AFD1F1581F94FCF09FAPH7PR84MB2245NAMP_--


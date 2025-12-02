Return-Path: <openbmc+bounces-962-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE4C9B8BE
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 14:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLLYh0l4Hz3brL;
	Wed, 03 Dec 2025 00:03:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764680616;
	cv=pass; b=K27m5wy8nT/Ac7k9MfD5k4sOe8n+x0oKnTOJ0CmSqE70qdiRR5R5//32DDk5gyrCt8LJM3HjomiNgNX14+LLXdwplr7HY79cnCWU89RxWbSMn66koZUASRBwVh/HAeGiIkSxcH9BlLZ1sqRS0Y0QZbn46QygBksM6uAB6NYrG/t5tbvj0vx5n4HO8v2kGEPK3qAOrPbiluaxSofqJw570cuanmeE4GjKf2W9uGhxB/+0O5x7GfjzS3L9WL7u7Dce/TyghoYHk4DBbLE9EadIaXKLtqja40NoqVibi2gTOY58nR/1dcQJnyn6W33nRIiHzu8rg0pywSUE5Vodlncn7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764680616; c=relaxed/relaxed;
	bh=2X4NIqAigOpp1aL7PNVoJQIhePehyBfX0pJtI3Gejto=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YeqYdMxo2fhUkGRRkFhOIWsv+smh8LWeirI3r5G7LDXFKX4y3jhyu5u0KzBBFh8rAxL4RyuR0805uu1J83fFW7+6/3gjGb0gnVidWSiTKyNX8qsQZJqk1Kc8vcK0OGR+2V3fkTyAKiW3TPUc3JupBMGkBBxRrtzco8miBRu39p4BipAPFNz2tPuP+PDVI2O/WdaxJF1j7bvhuzQ1wdYey2v1nYsyS2FWXhBk57LEI0vDaMQ/hun2ElBUJivAb9i+ROkmjS1puDMuZv8ibXg+SX+6M6sc6Kkt/FL0tABmRjbyBugLDmSkvIIDqyv1OPZCBk2SIcfNJuKVI6pJiqf43g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vertiv.com; dkim=pass (2048-bit key; unprotected) header.d=vertiv.com header.i=@vertiv.com header.a=rsa-sha256 header.s=selector2 header.b=XMhwgdWr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=pankaj.patil@vertiv.com; receiver=lists.ozlabs.org) smtp.mailfrom=vertiv.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=vertiv.com header.i=@vertiv.com header.a=rsa-sha256 header.s=selector2 header.b=XMhwgdWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vertiv.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=pankaj.patil@vertiv.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLLYd6CVVz3bqy
	for <openbmc@lists.ozlabs.org>; Wed, 03 Dec 2025 00:03:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ny9a+fqh/OxZr6alKXly9IvW/LxX59MMgJVNhIdo7GoLuCvknkAza0p/EMg1Q+p6cX6v7m37Mp1oQZYTX4+6ySj9smpf3chwqsvTtc8emyrl4Q9MU6bSyrFwqZ5iYHOSWNreLfAacGtVhlxKV3zs+CL4VKCfNzVQuCA5QsyywUQNIh1bdgAFKvTIVJI8GY9XWtA/q7mnN+SKlnCCGkEKboVR2H2sT1OkeWc2gniUtyld2NDWDxMcY/H1JL3ZQPNk8Kx6rSmgBRDIaTIzmBRs0c4ptg3tObNTe0GQslBqXV1i2zOuPhlpdnt+xLhwUPy+e1kZGV8MXVp3cjTYoDvtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X4NIqAigOpp1aL7PNVoJQIhePehyBfX0pJtI3Gejto=;
 b=dfT2O8VjQi3hhDId0As+oN0Tf2g6lmCf48OMdR3NWbTB6CVn3GspXP04IeXwpA/ZJnCZBivWFrP+wm43lJEiBaneVUiL2e7zgdexfZruji3znRUC9QwPoqF6vQLagZBM3mXry4eZKuX5NDg3W24l5tVzRxV5kCo6m0soLJ6oodS4uNFWm1CwvESELXhmU+H+OxRZ9uh+cnU1ivKFcKgwV6aD7T49lHabXR4Aiq+x0z4fYnyK9d4+pmxBTs0uX1sWmTjmUbrUQHtTRtKmcj3PZIDpcp4UElutD7G+TWHnhQsMFjUPRNSg7m9GiKVvvGLW27/TiUU8V2ScoJ4GrU863Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vertiv.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X4NIqAigOpp1aL7PNVoJQIhePehyBfX0pJtI3Gejto=;
 b=XMhwgdWr0hxPar0VJk4OdudmU6s+hoS+z+ImHs1KD/+RVsk2YNviNPuVn52Qu1K3UDisF/caqE6DYHqgROMM24GSqq9W9rRWLUT0QwW/dApW/GZ6ZffCjiCa92HsTXPwVjCdog4XybBcUqFBJTHiKcO+wH/43d0qcmNEHPIvotluprPWq/XEXZ3Q7/D1JGqfhyfDx9Crtxza/h6Bax/h4moaloqi1sPhc7a35QIsKwsb1oIudA5BMRZbyBUfo2S9ryPE8pX4KH2QHAMjJbYM2vqy+6yFOGe6i+X46u8XuEzTKkBwq2s7aB4oGQWxk824gHxBygl1nxFeCDy0JeLMMA==
Received: from LV3PR13MB7198.namprd13.prod.outlook.com (2603:10b6:408:286::13)
 by PH0PR13MB5493.namprd13.prod.outlook.com (2603:10b6:510:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 13:03:03 +0000
Received: from LV3PR13MB7198.namprd13.prod.outlook.com
 ([fe80::b964:e4e3:becc:323e]) by LV3PR13MB7198.namprd13.prod.outlook.com
 ([fe80::b964:e4e3:becc:323e%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 13:03:03 +0000
From: "Pankaj.Patil@vertiv.com" <Pankaj.Patil@vertiv.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Query regarding controlling phosphor-networkd Dbus "InteraceAdded"
 and "InterfaceRemoved" signals
Thread-Topic: Query regarding controlling phosphor-networkd Dbus
 "InteraceAdded" and "InterfaceRemoved" signals
Thread-Index: Adxji/v9bKnrFNUsQPmuy2u36U3RRg==
Date: Tue, 2 Dec 2025 13:03:03 +0000
Message-ID:
 <LV3PR13MB7198CC2543B453D23178F2CCEED8A@LV3PR13MB7198.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vertiv.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR13MB7198:EE_|PH0PR13MB5493:EE_
x-ms-office365-filtering-correlation-id: 8d6e7e94-da13-414a-f40b-08de31a320b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Y8agl2JQ5UbVAJsXsNWSj6GQnxVUgl/ipFLFQ7h0EFgGduuAXLc71tuGeuo2?=
 =?us-ascii?Q?orCVInZGG2NpDvsD9TVluhZHUqpkBvyBUug3BUfkhVKP0GhA1WJoefymG34B?=
 =?us-ascii?Q?UjJaU4zHcCE2S9am0D/qIjnFFU4krKPQALTLdIlKrYxrYMRkQoC5E5xFqZGy?=
 =?us-ascii?Q?WMaF6qmeQeyrSbhr5PSiBscd2cy4eS7pNWvRJK5U39ZgPq0r1Y6PXVtQzCIf?=
 =?us-ascii?Q?tjyFu9KX4nawVqlCbEtZmNXpA/hdBn6hqbmwSdijqV3Ak8yvdcwxi0fYiT88?=
 =?us-ascii?Q?8OcLjE9yW4Ke2AqzxcfX5JOAOKkS5DZIcZH+DtW31Y5kipgStEhrh5FkgV72?=
 =?us-ascii?Q?/7deZPKhOElF2AYD1xdwTStaJdg1BWFLeEYAiZp6bGIwMAqICIEcsC83bUFb?=
 =?us-ascii?Q?AtzuLX6FeNrOH+jxMFr0G0lLXIQlyIMSq154v8HCNN81dM/GpZR43b2+BL74?=
 =?us-ascii?Q?+F1ZQXVa+kIEUsrcKdinhS68JYDy5P40eN0ZQJR1jS+51hQ3+qC5FFue/xNT?=
 =?us-ascii?Q?D1QS48jnoroUX1feUG2IASX1FC0EccmTbSoR5M/uWVB/8LruLHNBGg/D1AK3?=
 =?us-ascii?Q?4xPmILiSazs+zEJT0HrUfCxaJRUufUPak0Kozj+nA6ZGCVVLYHLLRY5igEYP?=
 =?us-ascii?Q?y/xq2Dfnwf1iCuFFNbpZ+Wn6Xy1lo1jGIKdC6qMZJdKOCjj3vzih8AV1+R78?=
 =?us-ascii?Q?BwA+BR1CbCskN5v2z7i2JyoBzneaDk4o2Lo9W8zseUP/YDwwMqTf+wT821kB?=
 =?us-ascii?Q?bhR4Xrqp0z7F8BHf4HEzObOUacvnqVJdrSDxBcGgVcTE5iAWs38dfVkaZQyt?=
 =?us-ascii?Q?o5IBarKHD/U/W7G1QaMUdopYNAT6SDC1wglRLdcL50s4ZjjrNLDICsniCvC/?=
 =?us-ascii?Q?Cho6WqB+6i64vG0eNk1R8y9kih7Gk0F0M0aAnwdEo5KfZ59r9LHaq3CYFA7j?=
 =?us-ascii?Q?luzYBvtilgxm0UzUiWjau1Kdqg2Y+NJy+/ba/Aq+sVNiaJ4PKoHd3qx6xCH1?=
 =?us-ascii?Q?eaqtvi0sAIW7aA+vGzzpoJrLrX+RIF/gOh72mxuplkKtrXP7mGdUqyf5mMmJ?=
 =?us-ascii?Q?3aPQhUKfsWfLhKJ19WCVSdxsgg4/xBc410IJg9LYbcfwBz/bFv5oW4i+GXKZ?=
 =?us-ascii?Q?LOMiO0By3u6vi14Y4kTKmimy+BeB+t7qBi9dMVpm7V0WVMsoHN6W2+wcFe/I?=
 =?us-ascii?Q?aBfKjUmBwhWINAJwXvph4ILDuJ1PTFHHKTXsRypSmRnEmgJZZBiTMxLUKyJ4?=
 =?us-ascii?Q?ZNXtLlEmEiBBiiwW0fHLhwGvKJ1aAL8AQVXrC+ZAib1Fwb9+nuHNd/lmODkx?=
 =?us-ascii?Q?6RtBf0ALaDQ/l1sYucfThKN4blxfvYcJyrxgTIUdcrMO/+LRVr9c7jaa5HFs?=
 =?us-ascii?Q?1Fysv5qJTAgITFaO+DxIkvhtHsFsAXQ2aedWr2fFIAFcA318ore/2pcTS0FE?=
 =?us-ascii?Q?xTnfbNxYrZ116L0ydsqR6NBjS+KIMMLm43I9S+DDbDb89DuR92mdLN+OHGRi?=
 =?us-ascii?Q?ZYVY+cCwYNaIBAQJxGgDgjCYe5AX2siSPGCF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR13MB7198.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TCTNnCm/qZgCxRd2JCJ/GLhAS66Ce83B/dUaVq6OFyPMsMjH+ZQciLNOZ0Rl?=
 =?us-ascii?Q?Evnv2KoBxYJntGvYANZmLco10Uai6cbz1DzVTWkumdMkrfvmyfMX1Tvg4H0S?=
 =?us-ascii?Q?95YYcNISqI4HgHUeiL7Bnkr089l/IcHhVsSY0I0vNv3Q6msmKHan7jOyEoIz?=
 =?us-ascii?Q?4FhKPcrnr/bQ42JKpdBMcjKq8zn5Sw3VCA05MWBufgvqMIrPSqKfsJp/lyzr?=
 =?us-ascii?Q?LkDcovEXYifD7kZszPv+EnN66z/LMhQluWMgHn6XVI3ojota2DZaJl6tSxqO?=
 =?us-ascii?Q?ehmrcpHAHW27PYt5VZ8aljjUAp2qGHphF3uPtRcV9IIhZxE+ljQOWweXsdtR?=
 =?us-ascii?Q?akCcsKT48NlxkL+TCiJgldNTLtxNH7E8YddR7ItQwk9DvN9w/jPam/pCW985?=
 =?us-ascii?Q?i6ZMl6NG944hAsD2ixwStX34Kpimqi8x9GKL6GkdwlHKeigBJwy7mWRq6zol?=
 =?us-ascii?Q?FG+JicS0GlEr45MppULAlo1LKPJShThgomJDby1XkxYYS+YXin4z+2pKaH9V?=
 =?us-ascii?Q?3iQNGB3KaZ6v8O5dAV4ZM7Xc3EMQgIe3e/2w3YwylSbAFJhdzHbZ2R+NRR8K?=
 =?us-ascii?Q?KZsjhuB26vcrcRAjglWS7zZc1xeCTgeUrq5tQt7/n6I7efHuxKxhvcDwcI/S?=
 =?us-ascii?Q?m3af99ot/vOuN0oYkQd0WHoxLErAhiMcmga6p3MqkW9bKogcsTa468Hz4YW9?=
 =?us-ascii?Q?uoaGkKV87uteYIDySj0Fk39J/49EaYrp7nFO4tTPlAlzYUXE2OTcwxORVS/g?=
 =?us-ascii?Q?IHHU03uwTdhTBLtThhxpmnqvW1UeWXfA5WTJ+i6FbIgzjhblvWUk5ySDpepn?=
 =?us-ascii?Q?51lzuuV3MyM9PYCi9eqwId1d6mpcOagn+kA6Nqz3cpkWMp/HVZGZ4a6fAlq3?=
 =?us-ascii?Q?sCduwZDzF5SXnoiYnScg6VqU37FvbBD4zcO7fmdS62CTZITVldSExatZk8aX?=
 =?us-ascii?Q?9Xwe0x9jxM1P1Hi7taDvuNAwQVGEHP7XDiQAOf8/+jBcUeooY8+527Ec18Pd?=
 =?us-ascii?Q?4sZ8e1MQPTgm/cZKOpArf3zV2SdmfUkm57CBMK3Bbmg6ra2U1jtrL074LQB5?=
 =?us-ascii?Q?zRpkVOFg5SODPFWnX84Ct8+jLeyrcDgkPKNub6/zyoZ+m6A2I3uX68IX7eNw?=
 =?us-ascii?Q?yxB97Z74BCJljq9dzmOjIFQLOVrZfpzCG5QA6uq1XkeYSQDMDddHP0fOAzcR?=
 =?us-ascii?Q?JMG9lKKWUOk37SoOH8Dq5h4zat9P7ga7ls01rVersPWZXbXv3mBf86oY2Rsw?=
 =?us-ascii?Q?8TlcC3XXn8vzl1QdS/LKuFtpOvu4/lVvU7HJqykZKjZ9DOgW8hUtiHH9u8NT?=
 =?us-ascii?Q?pbfh7wel/cdNXKQnZqNlu+eGiZrJplu2/Ot2D2RE/G4/vgA5/4WxN+c82R75?=
 =?us-ascii?Q?cfmkExoaOraP4SU2N2jUtRxoK2qjJKjIwvYudxYHeluNK54KtUUg0x1N6dXF?=
 =?us-ascii?Q?cdas/YlvQ1gJ2gtRikjNHyDk5ecE5bg9lswhbOSIQ+hXliMDa/AVjEhauIzg?=
 =?us-ascii?Q?M252VRHjRJSywMs2Qy4k4O3BxEnNurw/ZHOis17CYUigKQWjRTzm9OsiMt/u?=
 =?us-ascii?Q?xKAJxOTBwIGaQf575jwRV1r4jlLowvDQPzVG9G8o?=
Content-Type: multipart/alternative;
	boundary="_000_LV3PR13MB7198CC2543B453D23178F2CCEED8ALV3PR13MB7198namp_"
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
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR13MB7198.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6e7e94-da13-414a-f40b-08de31a320b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 13:03:03.1330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9y5lSiZsbIcnZbJlovzDqucSCVZQ+CEDSmOUQfonbfkOXfVE1BHGxoQXhSS92LwlPQA7uFDoY56KN9SzMaivo/Lpx6HwS2d1wvmhdT7aBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5493
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_LV3PR13MB7198CC2543B453D23178F2CCEED8ALV3PR13MB7198namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Query regarding phosphor-networkd:

With the openbmc version 2.18, I have written a custom software module that=
 registers a callback to monitor the Dbus interface signals: "InterfacesAdd=
ed" and "InterfacesRemoved" from the phosphor-networkd.
I tried switching my ethernet interface eth0 on AST2600 SoC from DHCP to St=
atic IP.

I could assign static IP successfully to eth0 interface and DHCP IP resourc=
e is released. But, I have several observations:

  1.  I see "InterfaceAdded" Dbus signal emitted first from the phosphor-ne=
twork for DHCP->Static transition. I believe it represents a creation of a =
dbus static IP object, interface, and properties.
  2.  Followed with it, "InterfaceRemoved" signal is emitted from the phosp=
hor-network that deletes existing DHCP IP object.
  3.  In the signal callback handlers, I have a custom implementation that =
consists of a mutex lock for my database that is acquired when the "Interfa=
ceRemoved" signal is received and same lock is released when "InterfaceAdde=
d" signal is received. Additionally, I did several database updates based o=
n the signal received.

Now, I see an issue where this database lock is always acquired after DHCP-=
>Static transition. Additionally, some of the database properties are corru=
pted. After root cause analysis for both the issues, i concluded that it is=
 due to the order of the signals mentioned in point 1 and 2. Consistently, =
I see a similar order of the signals from phosphor-network i.e. "InterfacAd=
ded" first followed by "InterfaceRemoved"

I want to understand if there is a mechanism to control this order of the "=
InterfaceAdded" and "InterfaceRemoved" signals from phosphor-network to ach=
ieve consistent behavior align to my expectations. My expectation in this c=
ase is "IntefaceRemoved" shall always be emitted first and then "InterfaceA=
dded".

Thanks,
Pankaj Patil
CONFIDENTIALITY NOTICE: The information contained in this message is confid=
ential or protected by law. If you are not the intended recipient please co=
ntact the sender and delete this message. Any unauthorized copying of this =
message or unauthorized distribution of the information contained herein is=
 prohibited.


--_000_LV3PR13MB7198CC2543B453D23178F2CCEED8ALV3PR13MB7198namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:815686172;
	mso-list-type:hybrid;
	mso-list-template-ids:1851837318 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Query regarding pho=
sphor-networkd:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">With the openbmc ve=
rsion 2.18, I have written a custom software module that registers a callba=
ck to monitor the Dbus interface signals: &#8220;InterfacesAdded&#8221; and=
 &#8220;InterfacesRemoved&#8221; from the phosphor-networkd.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I tried switching m=
y ethernet interface eth0 on AST2600 SoC from DHCP to Static IP.
<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I could assign stat=
ic IP successfully to eth0 interface and DHCP IP resource is released. But,=
 I have several observations:<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><span style=3D"font-size:11.0pt">I see &#8220;InterfaceAdded&#8221; D=
bus signal emitted
<b>first</b> from the phosphor-network for DHCP-&gt;Static transition. I be=
lieve it represents a creation of a dbus static IP object, interface, and p=
roperties.<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"ma=
rgin-left:0in;mso-list:l0 level1 lfo1"><span style=3D"font-size:11.0pt">Fol=
lowed with it, &#8220;InterfaceRemoved&#8221; signal is emitted from the ph=
osphor-network that deletes existing DHCP IP object.<o:p></o:p></span></li>=
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><span style=3D"font-size:11.0pt">In the signal callback handlers, I h=
ave a custom implementation that consists of a mutex lock for my database t=
hat is acquired when the &#8220;InterfaceRemoved&#8221;
 signal is received and same lock is released when &#8220;InterfaceAdded&#8=
221; signal is received. Additionally, I did several database updates based=
 on the signal received.<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Now, I see an issue=
 where this database lock is always acquired after DHCP-&gt;Static transiti=
on. Additionally, some of the database properties are corrupted. After root=
 cause analysis for both the issues, i
 concluded that it is due to the order of the signals mentioned in point 1 =
and 2. Consistently, I see a similar order of the signals from phosphor-net=
work i.e. &#8220;InterfacAdded&#8221; first followed by &quot;InterfaceRemo=
ved&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I want to understan=
d if there is a mechanism to control this order of the &#8220;InterfaceAdde=
d&#8221; and &#8220;InterfaceRemoved&#8221; signals from phosphor-network t=
o achieve consistent behavior align to my expectations. My expectation
 in this case is &#8220;IntefaceRemoved&#8221; shall always be emitted firs=
t and then &#8220;InterfaceAdded&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Pankaj Patil<o:p></=
o:p></span></p>
</div>
<!-- Confidentiality notice banner -->
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%">
<tbody>
<tr>
<!-- Remove the next line if you don't want the Gray bar on the left side -=
->
<td style=3D"background:#313131;padding:5pt 2pt 5pt 2pt"></td>
<td width=3D"100%" cellpadding=3D"7px 6px 7px 15px" style=3D"background:#fb=
fbfb;padding:5pt 4pt 5pt 12pt;word-wrap:break-word">
<div style=3D"color:#222222; font-family: Arial, italic; font-size: 7pt;"><=
!-- Adjust the font family and size here --><span style=3D"color:#222; font=
-weight:bold;">CONFIDENTIALITY NOTICE:</span> The information contained in =
this message is confidential or protected
 by law. If you are not the intended recipient please contact the sender an=
d delete this message. Any unauthorized copying of this message or unauthor=
ized distribution of the information contained herein is prohibited.
</div>
</td>
</tr>
</tbody>
</table>
<br>
</body>
</html>

--_000_LV3PR13MB7198CC2543B453D23178F2CCEED8ALV3PR13MB7198namp_--


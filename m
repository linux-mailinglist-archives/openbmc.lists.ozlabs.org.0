Return-Path: <openbmc+bounces-555-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAAB3F173
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 02:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cG5kS4K9Zz3057;
	Tue,  2 Sep 2025 10:11:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733643;
	cv=pass; b=YZHEoSEUxWTUOEPY27lqxibsp6NEFiqpgZVu0OfQzZpTD8PbndYUdWIhurqRmRoRqmtrNYyIxnL+E1VMapmu8UZiu41owJPz7pzxv3B3441jVWjMr5cH2HmkT3E8zFB/tkahzwFA9fBQy/CArsThER+luiW27ohekKb9so1+cqVJcf1i5Q7atyahkUPCKYoBA4WjT4PIjwSbg1Gbduw/QaCe7urrMUOGhozG4NDuN6+valNhpZTaGYoYfUhL+QGZdlcGJJ63DT9nABsxNIWzc61Mjj4EugScpzfHoD78Eg5b+ILGgYocSSc/pZ/HJd0opPqfCSLsx/GWTfKb4L2vLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733643; c=relaxed/relaxed;
	bh=NoM/t0yCnt10ZWMppA1UKry1UNyIyUaqB2NiOL/ASiY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BIMi2AVteC40Ptouw8uWbbVX+YiopfpzRQ9nsWpV4Zhb/oMTX7cU4DarKf93QwvCotYUEx0/1fUYrZtaoVp5k73NiiNJd8LElWrJHmSQJHs94nyVFZcSko1+NILyngC0gj43eQ78Yo6u6k+VHALxDoR4nU8ZFtFhbB35TBsznxtC1LJH5ICJEHabM4Nso4+9ik7Jl9QfMwV2zBIx4b6R0PIk1sK3WjmheK02L3U69myhz/cOgr/V4fo6i2uYEafFuiYqI9wxHpahq5SRjAZkHHGDrmbddH0RYcgVUiHPGnUAG/6iHIEfdxO1PY4J99Z/W0+AQMi4qe9nR6LlqDVVlA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gipHlHUY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::601; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=haghera@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gipHlHUY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::601; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=haghera@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqbG0V27z2yyd
	for <openbmc@lists.ozlabs.org>; Mon,  1 Sep 2025 23:34:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB/CzR8wRL6e2G8puWnIeDkl9Nhyu7aIPngvVyBZRo+Z48W85WsD/uy+a0SO0HDzaA2f6ytnocPcAECHqkEGTuWDR9KXUMBlzEiZRogDMUN6kGZCYSuGJGt5iXm3I2Fxv7yhj6O9oxfliOgItzZHHeIaND1CKQkFsIoLxgzH8PvyssnssasGoo+QIN7ds+FpSXSur2qJVpi4ayJr5abeOpNu6PI9dciETvKrBDKKm8shbQ/WRAOUQ5nFZQyOX4E7du9Wymsv3viO9kOWyTbuFwB5jVor6LebKABv5sd5MHERUcBwPgyJQGlD1OfTcsnJmgp9m8xVGE7lAMMq1sesmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoM/t0yCnt10ZWMppA1UKry1UNyIyUaqB2NiOL/ASiY=;
 b=zL35evH1uh4v0KiCAeM7ELhyUIpc8so6mwHYm6fsnRnIBi9zealC2TB/lwdQDU5FUSEziGxCe9kHLd5nXheuYeBFaNDqjKjmJ8CpwjP57U64omtssGD3CD6XcKgah3gf3qZxhHjbqjPc51f63DbIGwlSJ7cvgNLFksIBA/MJfdqQQJlmVMulxzjSMevYvfwyIUhEgSoHSrKSsTVaJFIWGN5cX7kHpkWFUnRCrb2iLlew/JD5IrCYiU3Bh72wci+aQCpIuzFAsm+6RY9pSOxQzUYermoTXCGdjIFAYOCp5purvZsbYhsdHxmRQZMjG6c2OQJNkR+xabvtf0Dri6jI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoM/t0yCnt10ZWMppA1UKry1UNyIyUaqB2NiOL/ASiY=;
 b=gipHlHUYcZLXJzgWF0DNR8LS/wnA3ETszz2Lh2ohValZmRoXLMaQV+amrj3c3GZwKvKV0Mt23Dt6kHzF3u6DYtpq1In6ifUEGu5zMTkaCit27gFMTFygcT7+r3q7xdWAmEKuoJB5CVzbOdfiMJ6wR4gV7QN3Lz2FoVvrkldeY0Hip/TSJhrctLskD2pEmmleyL/HzKNX/3szpXPtviLfWoyZqqRosNziA+6srjsVpRqeJs/hpT5XUW8ZFZZG2bxKqjx71rohtx25PkWX/7M6h+o05jR9mTHmhhD4MA63b1v3LCxBWV7X+7Fv+1xt+yhOf5Lt845u5BRq6fkuIAYcpg==
Received: from CH2PR12MB5514.namprd12.prod.outlook.com (2603:10b6:610:62::9)
 by DS2PR12MB9662.namprd12.prod.outlook.com (2603:10b6:8:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 13:33:41 +0000
Received: from CH2PR12MB5514.namprd12.prod.outlook.com
 ([fe80::c167:749c:368:7560]) by CH2PR12MB5514.namprd12.prod.outlook.com
 ([fe80::c167:749c:368:7560%7]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 13:33:34 +0000
From: Harshit Aghera <haghera@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Deepak Kodihalli <dkodihalli@nvidia.com>, Shakeeb Pasha
	<spasha@nvidia.com>
Subject: preferred approach for Sensor PeakReading property in dbus-sensors
 and bmcweb
Thread-Topic: preferred approach for Sensor PeakReading property in
 dbus-sensors and bmcweb
Thread-Index: AdwbRPMpeXLKOuDlRdyyXQMbO7LSAQ==
Date: Mon, 1 Sep 2025 13:33:34 +0000
Message-ID:
 <CH2PR12MB5514052F3E412F7AA360637CD807A@CH2PR12MB5514.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5514:EE_|DS2PR12MB9662:EE_
x-ms-office365-filtering-correlation-id: 59805895-978d-47eb-1239-08dde95c265a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ioQDaYjAI5aU5ExFl4G4MuLaBJc2K6YZas6zO9F0MRL4c5pRLq4IAXhBQajN?=
 =?us-ascii?Q?luKI6D3b8K1v5sdm4qqBESVGM3L5Dy4aMK+z4yp748cOUyiBA5wFzD3ZOVQV?=
 =?us-ascii?Q?MwjhGa699Es6dab5VKWO1LLJvQvsh/jC3m/EysI1yod1vE8RVmer9PLO8BRa?=
 =?us-ascii?Q?25jicTC6iEN9b+m8MOEMjHiQVc0tBwuDgrHGOePRfTbX+9hOKmnLCKw25K0+?=
 =?us-ascii?Q?E+DGjBMblydWxrGaWkn6c6Fll1vcGgVWKUhJg5hpvtND6hN4SDqjABkdH99M?=
 =?us-ascii?Q?vRECIzsWPag+G4KPyce1//vZ2Tv46uDBUzrAXS8D+oggweM1T3VEyfCOoHuH?=
 =?us-ascii?Q?riFaIT/kCOIVsFsCXHmDDHUo3gtnddqM0/d+AJSuZb3+QsEAADDk6WxrVyWA?=
 =?us-ascii?Q?5QDpb4v7E70RsfZnrSJRZH38dUFkUWTHl9wOQh3Ziw4bSlusGzpTsZgYZo4O?=
 =?us-ascii?Q?8hW8P5ubvrFM5NXf1fie53hgdFeoEM+CO/jyjEhRV86sRgmY/SirN47lZ9mF?=
 =?us-ascii?Q?BrYrhKg5lWArLrdvMKoex39N/C3Yt1iLvZoGH95TkQyD+c1QZj6nrg86M8ow?=
 =?us-ascii?Q?9EhVL7p+H9Wrc/eGX0CjMD+kPOGCoL8Ug0lMm5mHUUMNiHULSoX3nK9H4sfs?=
 =?us-ascii?Q?+ZHtCuGGgj0LmbFF3Sb9M8i8TRlFqKIFGIjd0/JPojauMRseYTmCuP5+PHye?=
 =?us-ascii?Q?674KNJudMjQgDhWDQaalxLOjsNet6yPdFE5H5D+MiH74vbOOqIw29GOJFmWQ?=
 =?us-ascii?Q?Pm9Vbu4GeeoxvD0XV0y/tAxuaH6GlSIphocyui4Rvp9Lz46v61y66iGjZKeA?=
 =?us-ascii?Q?MJmh+FiSJClxvMV7CTCYtKpFE5Yizd8LYcE9RXSnJigCUtvyyFRQVaWjY3RF?=
 =?us-ascii?Q?cWyWlzZ3FKIosEyHs7jSrMOmKRvqGPYfdpGxT7DXis97/sSmfRMvCTLDFjlN?=
 =?us-ascii?Q?GBoj5dncbs3FjkZy3pcFLJ14zN7sAsIs41JS5OaY4CsSFQ0rDKCpSyO89+p6?=
 =?us-ascii?Q?OqauXkix677uT+oh+Yp2qpcxPEhwBq0p04oV3r4zLP3uFoK7qMohCUubNe3Y?=
 =?us-ascii?Q?016aurRPRsCopERzELiwT3ZWRDDM15/r9le5Oq0j+NkyDgC0EFqyPp//rm9N?=
 =?us-ascii?Q?h3XI0ic4fRoFYBSUzAxGXGUHlWOHcLtav0JzLeK9vXOPCUcu57Av8PDZ3g7t?=
 =?us-ascii?Q?YOhCB1542V/lTYrvQyjTBII+QpRynNAJ9fKdV2R1RotvLUh0xviEtvr+/udh?=
 =?us-ascii?Q?rJhiEB3GPhZ3xVyUd43Sw9JRqXPcOdTc2ksqb+Aai8eXYc3KIqcUL54DftPH?=
 =?us-ascii?Q?zGOuv36bjAvnOYH4nDikFcaQN2KWD8LV6wNTESYcMEc/hnvcs/buV6dFouyl?=
 =?us-ascii?Q?TUWCQLy7CqIVm6zz+kDj2y3UNCO8sgz4PjZlErGnhUq1AuMozKzH73xZwZJQ?=
 =?us-ascii?Q?yEv67aJ9dHmYZWVWIrozmAMFIqfwP1rOZwAs1Er5lFcnB8Tk10VtSWX6dcfn?=
 =?us-ascii?Q?+9TYkLSk+RUsGCw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5514.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Gad/gk7hpJfVcRwXGwKN77RnHXgQM0BX4wsVQB+etbeRxabH4Bz80319brCZ?=
 =?us-ascii?Q?cq1EtGvNLnnuh4GIciE0Ij3ZbfGoEHCPpUcTJNRVGySWEzTN9ebGKws4vWOI?=
 =?us-ascii?Q?hc+op4/PDPeyf9/IvWgeMv6MmQ8zv3PfE+daluFOnqwPsYDyAM0Pwu6wzKf5?=
 =?us-ascii?Q?xoeW0LbLEPQiCLL77rGeRG2pNp0k5R5Yt2gydtX345E0ae0gyMM4B2Ax650G?=
 =?us-ascii?Q?Nl4vqfPcIozL529O+aPaD2mL2w0gEYL/PS9+urfTq4prLtrn3v78reph5wMD?=
 =?us-ascii?Q?g/EXYKKodBJwsVRT5NvHfBdQfIZB20vMlV0SeS8sQzt5nATH1EE9rKy/Z7T0?=
 =?us-ascii?Q?tQ2/gSppXdn6kNmbxVn6LAO2yoJdnBFkOGKPnWw91kU5nYM9lB7N9ZI7+tXy?=
 =?us-ascii?Q?hDf0c/UnB/7NBOPHrGikg6HS4S9u4M3UyRRNy2ujuCt+QvhYWSWmz0agtt2g?=
 =?us-ascii?Q?sGtm8PuQ6OvmD28/nCTN04Huf4tfO8BrmsnrcUlcMXgmcVTqMhM0oPhcGPP9?=
 =?us-ascii?Q?XssZQ/GEYPcaBz2RhCYtGs4sDCqZzfJnlkBBSUr79HzZUoOvZklWT3ckh2ey?=
 =?us-ascii?Q?uUkER0ESLL9MqBz6fsoG6yYG2e83vrxLujxMsEd+1BCrLAOW6ymkYHOo6QW1?=
 =?us-ascii?Q?QsFuDACPHQmCzlDBFyUsNyAzvVJquVejfXRXsAoiRbGMIcmaxrJSQ1YqoMHk?=
 =?us-ascii?Q?fNVHBLOcljxq3sZBE8M/QhuzClJQY5KxLxj4zz+/18V1QCTzCo4sjwhbBGh8?=
 =?us-ascii?Q?mClbgJliWoRt0JjkugLZqhKhw5acKpIT9Dn2VJCdpSx2J8yorj1MwF19clbW?=
 =?us-ascii?Q?KpUPGIUOkEJAb9Ms8mr6oOg6sOo3ojclkYchNTpZfSuLdpatJhQLyIf1Pi5W?=
 =?us-ascii?Q?z4hNKfvPzOC+fUFkZUk3w9MbnpvsuZoz/Fl2VYlOCQ4sgX5bvtA+cisHSrL1?=
 =?us-ascii?Q?93O8VX2ciwzmI4bQgfLB+rGPNsGlGgY4uAsXDSWeDBY63zluaQ/Lr1Cy8w2k?=
 =?us-ascii?Q?g7bNM1vw7R9iaIaqsAppIxF1BbLeAqSuIkPg0cxNWSNNNLB8ILsSG3gUKcb5?=
 =?us-ascii?Q?mhhLjuGXROfZY92gVqX8k4cJ1AAZsngfS3CXdj09ndoBeqvVwoQSyhAR2+TS?=
 =?us-ascii?Q?GN/N9zMX5Nh2UmkX3oFYM8IYq6BXuTQEbLwwxcudbeGF1JkfITWWn6RFtGfJ?=
 =?us-ascii?Q?U2enyrkvfIXDPhPASznT95GzKlzVoHTkHm00IPE9dhxPYuEez3hrRgQpdZ13?=
 =?us-ascii?Q?Vma8uOJEwPBWEEew3jDJvjedtsDmIkz73pCb57x9RCr9/8VcT2d4vJxwI0DS?=
 =?us-ascii?Q?nNu2RWDgA5SKPAb2Wb6S4cmEpZi8J69UC4IH1sBDYnlkyoqzG4I7OOfNeK86?=
 =?us-ascii?Q?X1RLXfoiTP4+2w/onQV9iU9XbBqlnwf4eABeG/FkO0a0FkUIPpkX41G8yauN?=
 =?us-ascii?Q?vppIVF/RCLV5wn87JL9STnzW28ZOKGcrzb8Ty77uLQsscetmlYCZmfI3Agmf?=
 =?us-ascii?Q?DGLpwK3Dxwx8GVcpKPJh9j8T7zIO/M6Mn05ui6jrcmakbsKCAAv5wXRwst7j?=
 =?us-ascii?Q?pBFWO2wh+tos0fMlFic=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB5514052F3E412F7AA360637CD807ACH2PR12MB5514namp_"
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5514.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59805895-978d-47eb-1239-08dde95c265a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 13:33:34.5687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gz9cHHUTdsZzCrLCGkfUrpKnCr6R+r26fRcC9+ZWcjFXNeDl/rKUCYzNlC/ILfMXpiNmCDSWdwh0c3rfAgwQCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9662
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_CH2PR12MB5514052F3E412F7AA360637CD807ACH2PR12MB5514namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'd like to get your input on the preferred approach for adding support for=
 the Redfish Sensor properties PeakReading and PeakReadingTime. Per the Red=
fish schema, the Sensor resource should also support the ResetMetrics actio=
n for the PeakReading property.
https://redfish.dmtf.org/schemas/v1/Sensor.v1_2_0.yaml

Context: We have a GPU device that provides PeakReading and PeakReadingTime=
 for its Power sensor via an MCTP VDM command. We plan to implement support=
 in the dbus-sensors app nvidiagpusensor.

I've outlined a few options below. If there's a better alternative, please =
suggest.


  1.  Use xyz.openbmc_project.Common.Statistics PDI
     *   Use the Statistics interface to represent different sensor value s=
tatistics, with PeakReading as one such statistic.
     *   PDI patch: https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-inte=
rfaces/+/78348
     *   ResetMetrics would be supported by implementing a DBus interface a=
t the same object path.
     *   Open question: which phosphor DBus interface to use for ResetMetri=
cs?
  2.  Use xyz.openbmc_project.Telemetry.Report
     *   Configure OperationType as Maximum.
     *   This interface already supports the ResetMetrics action.
  3.  Treat PeakReading as a standard sensor (Sensor.Value PDI)
     *   Expose a DBus object under sensors/power/<sensor_name> with a well=
-known name (e.g., peak_...).
     *   The association to the "actual" sensor would be handled in bmcweb.
     *   ResetMetrics would be supported by implementing a DBus interface a=
t the same object path.
  4.  Same as option 3, but use a dedicated namespace
     *   Define a new path: sensor/power/peak/<sensor_name>.
     *   The association to the "actual" sensor would be handled in bmcweb.
     *   ResetMetrics would be supported by implementing a DBus interface a=
t the same object path.
  5.  Use an OEM PDI
     *   Implement PeakReading/PeakReadingTime via an OEM interface.
     *   ResetMetrics would be supported by implementing a DBus interface a=
t the same object path.


Looking forward to your feedback on the preferred approach.


Harshit.


--_000_CH2PR12MB5514052F3E412F7AA360637CD807ACH2PR12MB5514namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:223493061;
	mso-list-template-ids:1999303360;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1
	{mso-list-id:309940031;
	mso-list-template-ids:-306837962;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I&#8217;d like to get your input on the preferred ap=
proach for adding support for the Redfish Sensor properties PeakReading and=
 PeakReadingTime. Per the Redfish schema, the Sensor resource should also s=
upport the ResetMetrics action for the PeakReading
 property.<br>
<a href=3D"https://redfish.dmtf.org/schemas/v1/Sensor.v1_2_0.yaml">https://=
redfish.dmtf.org/schemas/v1/Sensor.v1_2_0.yaml</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Context: We have a GPU device that provides PeakRead=
ing and PeakReadingTime for its Power sensor via an MCTP VDM command. We pl=
an to implement support in the dbus-sensors app nvidiagpusensor.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve outlined a few options below. If there&#8=
217;s a better alternative, please suggest.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo2">Use xyz.openbmc_p=
roject.Common.Statistics PDI<o:p></o:p></li><ul style=3D"margin-top:0cm" ty=
pe=3D"circle">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level2 lfo2">Use the Statistic=
s interface to represent different sensor value statistics, with PeakReadin=
g as one such statistic.<o:p></o:p></li><li class=3D"MsoNormal" style=3D"ms=
o-list:l0 level2 lfo2">PDI patch: https://gerrit.openbmc.org/c/openbmc/phos=
phor-dbus-interfaces/+/78348<o:p></o:p></li><li class=3D"MsoNormal" style=
=3D"mso-list:l0 level2 lfo2">ResetMetrics would be supported by implementin=
g a DBus interface at the same object path.<o:p></o:p></li><li class=3D"Mso=
Normal" style=3D"mso-list:l0 level2 lfo2">Open question: which phosphor DBu=
s interface to use for ResetMetrics?<o:p></o:p></li></ul>
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo2">Use xyz.openbmc_p=
roject.Telemetry.Report<o:p></o:p></li><ul style=3D"margin-top:0cm" type=3D=
"circle">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level2 lfo2">Configure Operati=
onType as Maximum.<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list=
:l0 level2 lfo2">This interface already supports the ResetMetrics action.<o=
:p></o:p></li></ul>
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo2">Treat PeakReading=
 as a standard sensor (Sensor.Value PDI)<o:p></o:p></li><ul style=3D"margin=
-top:0cm" type=3D"circle">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level2 lfo2">Expose a DBus obj=
ect under sensors/power/&lt;sensor_name&gt; with a well-known name (e.g., p=
eak_...).<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 level=
2 lfo2">The association to the &#8220;actual&#8221; sensor would be handled=
 in bmcweb.<o:p></o:p></li><li class=3D"MsoNormal" style=3D"mso-list:l0 lev=
el2 lfo2">ResetMetrics would be supported by implementing a DBus interface =
at the same object path.<o:p></o:p></li></ul>
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo2">Same as option 3,=
 but use a dedicated namespace<o:p></o:p></li><ul style=3D"margin-top:0cm" =
type=3D"circle">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level2 lfo2">Define a new path=
: sensor/power/peak/&lt;sensor_name&gt;.<o:p></o:p></li><li class=3D"MsoNor=
mal" style=3D"mso-list:l0 level2 lfo2">The association to the &#8220;actual=
&#8221; sensor would be handled in bmcweb.<o:p></o:p></li><li class=3D"MsoN=
ormal" style=3D"mso-list:l0 level2 lfo2">ResetMetrics would be supported by=
 implementing a DBus interface at the same object path.<o:p></o:p></li></ul=
>
<li class=3D"MsoNormal" style=3D"mso-list:l0 level1 lfo2">Use an OEM PDI<o:=
p></o:p></li><ul style=3D"margin-top:0cm" type=3D"circle">
<li class=3D"MsoNormal" style=3D"mso-list:l0 level2 lfo2">Implement PeakRea=
ding/PeakReadingTime via an OEM interface.<o:p></o:p></li><li class=3D"MsoN=
ormal" style=3D"mso-list:l0 level2 lfo2">ResetMetrics would be supported by=
 implementing a DBus interface at the same object path.<o:p></o:p></li></ul=
>
</ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Looking forward to your feedback on the preferred ap=
proach.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Harshit.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CH2PR12MB5514052F3E412F7AA360637CD807ACH2PR12MB5514namp_--


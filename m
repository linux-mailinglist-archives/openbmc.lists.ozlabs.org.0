Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8A9D4B46
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 12:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvFqw2D5Bz3c5R
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2024 22:09:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c408::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732187384;
	cv=pass; b=FCbst6XWI+72zkGnTgLtDEF+Dq+WKjtTNALLQV/43GCWHl1XnybHa72kjBIkt4bg/kzboE7C/lONNyEDV0Ok+zuRFewQwK3ljNqJXodjW9x5ABssA5YHccApVR0Hk4B2W54wiNKJMzgTyQ5jpEUxjEJeUb27p73jvto8bh1lZ1qAirWkPN6iqwKaVOv+Ki/Zhi2WYWBKjDSCCgTKKFStgytzaB4wz2nCEmlOA4Kl93RcstjqttTYBNsWk6WWGmnvrN8mLgS0dJkV2FK4svNKMcxJ0+/dtNvYg4LoMAVSnQf9f95NYXci3nHFbbCvmwwqhLYDoqI9WA3MMqxCevS3xA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732187384; c=relaxed/relaxed;
	bh=kd8sT81lXAJAvZlRzUKCxtpsFpWz7CaXBMX1du9YNmE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GGoelJuwFSytRhypCXxGM3LG8XMzsBjY7VfcR1j/Wiar7tuQlII+lJSqk1EJxhmV1Z7f4HwKh1PJVmU8FmQC7QCBEMiUAJzikr+A7fWhKE4U3txHc2X3gO9pB5Ct5vqgoCrw2rqb9Z/yu/hBSB/cPsVUdpzBQp6MTmmO2DAtoEg/jZlwM9OW0imirIyT5oAP7KEH7dRDZsGZxMqUiCgBi73D/Ty5xsQMGP1PQEbKRD2VAta5q/sqgGYDgeT8JNbUiouWfo8HesWY8hl1Z+VZyqbc2Wq85vBzhwucmBKSulZDz6+75H0fQEpR2T9K53UWSjLKpwvb+8Xc+OA+Y8Fs0A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=Ltts.com; dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=w2urDcuL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c408::1; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org) smtp.mailfrom=ltts.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=w2urDcuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c408::1; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c408::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvFqp3lChz2xjQ
	for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2024 22:09:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTQeg2Z26tojsyCMIfz4oef3KvEbmUOw02+RUz5xIQDB/2M941GOt17ueCK8MSekjcla8VwWDSNYnxhxtO6r3/+DY/1zyszeQximeWt0LFGaAJcZ7EyL/gvVMljh41tKEtwi+wfKe/8MJB/zuira7bmxJiQFgGZHo3vXc+eD7Z5UxygBUEDp4af2o2S3VHZIxQNupMag3YQWv9pR7olg4Ycdw9LvRAqirC9PDT0fsV+atH9vG6BSlI1wsRrh3zJynl6c7FCoip5EqvS8HejfQEqheSxBvm65JfI7pUXy6rqrUxNDKhAF0AlsM1Qqhc0w+aIftf7AXoqDujYYMrktxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd8sT81lXAJAvZlRzUKCxtpsFpWz7CaXBMX1du9YNmE=;
 b=uCEZL0aFo0JXTwB0LQN4T+bmmWmaqc4ktHlc4GnAdvLhpMiekyEeSFPGFdtWupNr0Djk4zfHWKuMmmzgC8GVbS0/SCAf8fKJuoap8uKy7goUdv5miZWR6A2YUgoi2+pOrcaRsNqdht+jhdXwb89lr3v0oPvaLhmTAX005Uzt8OUYAyAZD6EkDPX2eOPF0ddj9SR4d4qyMQ3N6cOuB4J/JgGVYf9mBhQcPhbf7EMQJsKFEiqwEAE2GyJOLz5/XA32DnsuvcYI4nLPbUGHLhCljx5spMOtc7ocPeF3/iuBnC7X6FO6LdD5CI2oEsevG07WOC5TeMYWlBtW0GbZZ67tUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kd8sT81lXAJAvZlRzUKCxtpsFpWz7CaXBMX1du9YNmE=;
 b=w2urDcuLn8oYNqlZMOEPA3/KK6CbrBEm7BvsgyPnkgU+G+9cOHogZCoIRKJCwxkaTKxQhZ17Sz3hRuPJNd+4uCZzpSkTBdjPuqCTZ0195vPTSGb1ACKkKSytoPN7Gs2Ug6KP6OfGm/KPNLzOKFhX6lq0BOlfKWDvLTNN+S66DfgwJ2pasGZBi8/iGcbRoF8AM7bRwlQnj4vevfMO4iW+80Y/BywgmzVZnizCu5lx3IzInrJNVSSJS/yRLPnvh7sA/PWb3AF14BsUjQUu+bHVdjk1SDSFq3EBFOP1EfFRSpsUYhGEzgq2tIdaHe55lrQb+srAdDyEuYTU9Ltyi+LGAg==
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::13)
 by MAZPR01MB9178.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:10a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 11:09:13 +0000
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a]) by MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 11:09:13 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Help with IPMI SEL
Thread-Topic: Help with IPMI SEL
Thread-Index: AQHbOk6G+PEpblzyOkW6LdGkzK0dTw==
Date: Thu, 21 Nov 2024 11:09:13 +0000
Message-ID:  <MA1PR01MB4308FB122C49289902CB22D080202@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4308:EE_|MAZPR01MB9178:EE_
x-ms-office365-filtering-correlation-id: b985f127-73b9-4060-af4b-08dd0a1ceeb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?wIofZ37YPBwIcgazvyviVbu/Q3gSpCQNOXbK6PCqZQfMBffS5kT7UwJ0tb?=
 =?iso-8859-1?Q?ZQ2wVMn8L8x24s5B5xKltyLoZWoDTuPA+qtI+wBD1YkS+z9Lq1Kk39woRQ?=
 =?iso-8859-1?Q?pOy1DwCAsBJ9Zcrr3suxF8/aOIz54KkAdoZMIScHHRZwYgXUVkEkwOE9Sj?=
 =?iso-8859-1?Q?HOHyeGV1ELTZwCpgmychoRO61mI2cvmLeMiWZ7vOlghGMZhWheg2RnyGfB?=
 =?iso-8859-1?Q?YkxL7HSLOvSsJaHLWK9bFnkax48zLLsMUbDqt+zJ69Ds9ef3FBrnwYIT37?=
 =?iso-8859-1?Q?MJWCc0rpWyVZc2yi4eK+x0P/+RhSvEWTEF0wSQDdZoDcFuMm9exIcUNTPf?=
 =?iso-8859-1?Q?6Ajuw0Hlz8Fpt4q/5Kvvn4cfyWhz8f37yyukOkH/cTGE+ps08ryIBGRED9?=
 =?iso-8859-1?Q?MMfmq90yz3jcUPoGZVxSSK8XFVBQt9aATUPdemErZSlr4m459yAn2IyoMg?=
 =?iso-8859-1?Q?H3Zp8TtCChUMY+LSh+YY92JJKZW3/EICIZTr1r3EW/ovPkuNbvbiZhMyzW?=
 =?iso-8859-1?Q?/6WYtcJB9UDlU8XSSWXevKp4wRhbDRjc0fYj1LoM0i0nrNk5clhcqiCa39?=
 =?iso-8859-1?Q?fbjmQtET/9KhFLkrqfY2WPWTL3dcgk7eJw6ikqcoPw1Bx428JZivu4/xS2?=
 =?iso-8859-1?Q?4mQsLiCpmVm1rMMtkAXXzRS9voF4ktdKeN1Jj/fFng3HHZb71PeZe1lCbq?=
 =?iso-8859-1?Q?IxLt2jr5wZUVE4uJ1l5/BhFPT5j1uYE8THEGyq/oDwLR2V0Vd2yVWtunKr?=
 =?iso-8859-1?Q?h4626o6w3FoFGRztMo1/hcHAstLPIHfEyEYPjnnNhH79F602gNp1Rr3ISz?=
 =?iso-8859-1?Q?GGnfh3jtuffsLnbepmXTRaGm0Ywa0nDhpvJ2eJMwT3oMaxztjOJJFUjASh?=
 =?iso-8859-1?Q?RQ5LJFIxVNwEF4T1dbSxwNhaToV2k1bQLiJcSCZ+xZqxCrz8znRENQI/bk?=
 =?iso-8859-1?Q?lznNIkXjXKI0zkdwDv6GTS0YZkxZjqAKERE2DLM3hJ/9GzmFfvZfYqGSu3?=
 =?iso-8859-1?Q?9NZZFONfddgRcB4+gldGoOyG+lZLLROMJzAtj9x8GXFe8Jq5YeDY5TIORL?=
 =?iso-8859-1?Q?Ktt/qn2Dz9DdB3oaGIiTETthHDM/wbfs/6ZdYOOPTDNUOs5/0kTt7TpkCp?=
 =?iso-8859-1?Q?NHdVn3bf1LTsuuiR33v/27hhV1dF3dHLhAcaWWjUvekIHachGH+FR7xFuu?=
 =?iso-8859-1?Q?osnpi941HvqjDVT6w7b1CR6kVYMLKtAK35DyDzZtPpvNvvdQBw8UCfK3El?=
 =?iso-8859-1?Q?Nre32pUwZ4MJ0qume9XlIRzJPv49GhAQwpk2g9ILhmnKvxBYqvdhYJJcVK?=
 =?iso-8859-1?Q?SsTUmYG6zunydxsFBNxG37GHgcEI/OAZvHxk0IEALV+9frw4D3hB17ZGGX?=
 =?iso-8859-1?Q?FPZNhDsdbK?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?pELH9HgMb3Qsh3sGo8qSV4L28HhmoLW97EUPx9bXloXAvvW8l3wdIz4rfT?=
 =?iso-8859-1?Q?/rToGxw60728xo2R3BfZmYyO9Vt5R0fo/slUyZ/5aA4vP8GwOCOis23DeW?=
 =?iso-8859-1?Q?ia77b9bgGrwNuICBprlBxezosgS7Sv98dyTYG8uXVlDHxlyJw8u71986dv?=
 =?iso-8859-1?Q?ETlw2Y/eBzpado89u30F2miJ79lExES3iTb83EcWlbaAqxKnQe5ZceCi1g?=
 =?iso-8859-1?Q?gReUmQABYQmWAdYFvhC+uCZT0oJj7Q0k9NwW2KvWyVRcLBD5Srew/9U3UN?=
 =?iso-8859-1?Q?g0dJBEeavOrNU4gs/VRRRg3j6u/odNwQf+b6i+2J/B8NquT3iIiZgJ2Ebl?=
 =?iso-8859-1?Q?q+FSTglsb9EYNRycmde9yebmJ8bw2mpO/obvYFEJATViA1y2q8PjY+MsuV?=
 =?iso-8859-1?Q?1zcdccJ4YZdcXhTvt1+R+5R5zkpApEgTaz2sAqSVWThoNI6dcEGZW2cqO3?=
 =?iso-8859-1?Q?TiM/Oyi/frs3QP2NEOwXNqp8hGVcFmJQa7J+a18TPYTwK8/XkfYELpECBq?=
 =?iso-8859-1?Q?J10mYKd7MIuPq4p+7ki7rJYCEiEdg5sfuJBXUNHI+8QM7zg8Do5KbyatiG?=
 =?iso-8859-1?Q?DPiVAY8AwLETiiYMtf1C+EMV/1tynKzJEa8IwMHqho1X68prheMqObpgis?=
 =?iso-8859-1?Q?WuQmPEi4Ntv7pthxdkDHLtiyw7FlkKEp3bmCbdavBduFJMpeVKfXglrcGK?=
 =?iso-8859-1?Q?wJIXSMgJsEc2Ha5jdIMBtrvAaDd5pZFy88t0g96xv7D+F585pGMdnENc+i?=
 =?iso-8859-1?Q?VYSUizaDc09XGQB6phZtmi5S2hOeZ8rsBtbrf9o5C3ktmiFKztsBaZrRGr?=
 =?iso-8859-1?Q?uZicYGavDnQcBPsnNb1ckKaXXRVzr3TrpXxpvJ8aphNbrbfL3li9DV9REt?=
 =?iso-8859-1?Q?ybmTWllYa75jau35hLk6Qqi7+jmmECUgdEkVQZQmPQvQXiMjT4ZXgBI8o/?=
 =?iso-8859-1?Q?sfLZM5EHZoA0iYa/uYnD0FiPsjc8xAji7UsQt8umyxsB9tK5hMjzCm/oMI?=
 =?iso-8859-1?Q?/Gh8/MBd3k+L4Us/+s180uKYA5Lp0CVyT3CQOco6kf731fpOimfvKMuIPK?=
 =?iso-8859-1?Q?xtwD0SuKgQuoZ6IWFioGGhWjXdPefIk8l8Y82oSnczvmZDPevODNKiGnGC?=
 =?iso-8859-1?Q?tLUKbZxmxmaTv9ZSVyLtmeq6NxQRy0mHMkTiML9Aw2VHC25dM4yTSQqA93?=
 =?iso-8859-1?Q?SvukVjjqxAkCQJSfpuiMQdTIJKXb8pHgYRhHNS9BMRms2VX9ItO6qxn65b?=
 =?iso-8859-1?Q?vWV2NssnJo+TMv83X0DK96Dk33050H9941YE2thbXBLydFBZNTPQuZSUOB?=
 =?iso-8859-1?Q?WZAmSBpRvxXqvaoO0mUy2k5mAPq9tEDWqamY6NNy7FAQWR1LyEVypl28CW?=
 =?iso-8859-1?Q?TOnD0VpupxjXJKvmLdzM0HXMnHj8Kk05pXpcHpW+VrK2g+s4hr/TkQOfQ/?=
 =?iso-8859-1?Q?r2UKym4n7kxqM3FxGNVoxG+cvOwCTEOwxKMARlZ799dxgVVwpvHvW9iw3A?=
 =?iso-8859-1?Q?Km44DGLwQ55Jt9WVhgSCdiCO+fK+LkvNzwfY40eLk89N/6lP48jhvu+gxg?=
 =?iso-8859-1?Q?VFzqKXsJrtMJosSjDJuRd15SXMLUOaLCdqXQAReY+7NONuwo0NZZg6VS8p?=
 =?iso-8859-1?Q?GqyUuHyeebcKmCbYpiRlL7+WqdWyjq/gZi?=
Content-Type: multipart/related;
	boundary="_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b985f127-73b9-4060-af4b-08dd0a1ceeb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 11:09:13.6192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcHuvCzXVTq4qd9xlqUGFylpK12/ZPenGK/qhVC3IlymT5VvjAo7jF8uo1tMwY9pv7/wIXVpYL9sv9LABwqww8Y1m4ovCFcIHcQ0fkr4i8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9178
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Sourav Sagar <Sourav.Sagar@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_"

--_000_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm new to OpenBMC and IPMI SEL. In the entity-manager there's no option to=
 add and monitor GPIO.

Is there any option to add GPIO as a sensor. So that i can link it to IPMI =
and generate SEL.

In dbus-sensor there's no daemon for GPIO based events.



Thanks, and regards,
Bala Subramaniyan M,
Senior Engineer,




[cid:f6a5a5df-1e2e-4acf-af8b-6706dbc2a335]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your priva=
cy. Read the appropriate privacy notice<https://www.ltts.com/privacy-polici=
es-notices> applicable to you to know more about how LTTS collects, uses an=
d stores your personal data. Please visit our privacy policy<https://www.lt=
ts.com/data-privacy-policy> available on our website www.Ltts.com for more =
information about our commitment towards data privacy under applicable data=
 protection laws. This email may contain confidential or privileged informa=
tion for the intended recipient(s). If you are not the intended recipient, =
please do not use or disseminate the information, notify the sender and del=
ete it from your system.

--_000_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
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
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'm new to OpenBMC and IPMI SEL. In the entity-manager there's no option to=
 add and monitor GPIO.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Is there any option to add GPIO as a sensor. So that i can link it to IPMI =
and generate SEL.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
In dbus-sensor there's no daemon for GPIO based events.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Bala Subramaniyan M,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Senior Engineer,</div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-famil=
y: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><im=
g id=3D"Picture_x0020_12" width=3D"330" height=3D"2" size=3D"392" contentty=
pe=3D"image/png" style=3D"width: 330px; height: 2px; max-width: 728px; marg=
in-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid=
:a0b37949-935f-4385-9eea-2bbaa4fcbf69"></span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-famil=
y: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br=
>
</span></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-famil=
y: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><a =
href=3D"https://www.ltts.com/" id=3D"OWA508ca479-1c9c-5b99-5ffb-e26ec8d3385=
2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" style=3D"color: rgb(0,=
 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x0020_2" w=
idth=3D"249" height=3D"38" size=3D"5775" contenttype=3D"image/png" style=3D=
"width: 249px; height: 38px; max-width: 728px; margin-top: 0px; margin-bott=
om: 0px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:f6a5a5df-1e2e-4acf-af8b=
-6706dbc2a335"></a></span></p>
<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); line-height: 115%;"><br>
</span></p>
<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); line-height: 115%;">S1 Building, L&amp;T Tech Park, Bellary =
Road,</span></p>
<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); line-height: 115%;">Next to Raintree Boulevard, Park View La=
yout,</span></p>
<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); line-height: 115%;">Byatarayanapura, Bengaluru-560092</span>=
</p>
<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0); line-height: 115%;">Mobile: +91 9677035467</span></p>
<p style=3D"line-height: 150%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(13, 13, 13); line-height: 150%;">ENGINEERING<b>&nbsp;THE CHANGE</b></s=
pan><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12=
pt; color: rgb(0, 0, 0); line-height: 150%;">&nbsp;|
</span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(13, 13, 13); line-height: 150%;"><a href=3D"https://www.l=
tts.com/" id=3D"OWA6f9a153e-1dea-f5bd-ee84-012173b32f52" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable" style=3D"color: rgb(13, 13, 13); margin-top=
: 0px; margin-bottom: 0px;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%; margin-top: 0px; margin-bottom: 0px;"><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color:=
 rgb(0, 0, 0);"><img id=3D"Picture_x0020_12" width=3D"330" height=3D"2" siz=
e=3D"392" contenttype=3D"image/png" style=3D"width: 330px; height: 2px; max=
-width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"=
F:1|T:1" src=3D"cid:e93f10b2-dc59-432c-88ad-9b67a995a4c9"></span></p>
</div>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r privacy. Read the appropriate
<a href=3D"https://www.ltts.com/privacy-policies-notices" target=3D"_blank"=
>privacy notice</a> applicable to you to know more about how LTTS collects,=
 uses and stores your personal data. Please visit our
<a href=3D"https://www.ltts.com/data-privacy-policy" target=3D"_blank">priv=
acy policy</a> available on our website www.Ltts.com for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential
 or privileged information for the intended recipient(s). If you are not th=
e intended recipient, please do not use or disseminate the information, not=
ify the sender and delete it from your system.</p>
</body>
</html>

--_000_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_--

--_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-zanwnl2u.png"
Content-Description: Outlook-zanwnl2u.png
Content-Disposition: inline; filename="Outlook-zanwnl2u.png"; size=99;
	creation-date="Tue, 19 Nov 2024 06:46:45 GMT";
	modification-date="Tue, 19 Nov 2024 06:46:45 GMT"
Content-ID: <a0b37949-935f-4385-9eea-2bbaa4fcbf69>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-pnasq5ki.png"
Content-Description: Outlook-pnasq5ki.png
Content-Disposition: inline; filename="Outlook-pnasq5ki.png"; size=5482;
	creation-date="Tue, 19 Nov 2024 06:46:45 GMT";
	modification-date="Tue, 19 Nov 2024 06:46:45 GMT"
Content-ID: <f6a5a5df-1e2e-4acf-af8b-6706dbc2a335>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAPkAAAAmCAYAAAAGJz1qAAAVMUlEQVR4Xu1dC5xcVXn/zp3dzeTB
KyEQCkoA5SGCrWmBCkgaIMnOnQ1QjRUrWGzl4QMEm8zsJpExJDt3NgIqVZGfAkKh0vDM7s4mIWCg
IkIJ0KL4qCCmQpMCSRSSbHZ37un/u+fee+6duZN5ZPMo3u/328nMvefxne983znf65wIaham55K0
35iTSBqXki3PIUFTicQmEvIxfL+XdiQeotXztjbbfFwvpkBMgdGhgGiomfbuydRi3EM2/VVD9Ubo
/bQq+7OG6sSFYwrEFBgVCtQn5Ofnp9KweA49HljRqxTDJOz/cnZxKceQEO9CmSmR2An5cerrvGdU
MI8biSkQU6AuCtQSckFmoY9Ipspa+xF+n+E8E/aHqK/rycjezKUfJ0rcWCb0mykhjqQVmbfqwjAu
FFMgpsAuUaC6kE+7tJUOPWYrbOxWt4dBkvZ0KnY9RaYl3We/of7s0TUxODHXRlPHrMGKcKYuW7qQ
+hf8oGbduEBMgZgCu0SBaCG/aNl42lR6229ZyK9Azc45v9NWniRlne/j2ibR8ms21Y3BzCXvotaW
9X55KW6mYuaKuuvHBWMKxBRomAKVQl4u4MbgZOrNveG37O/i4n7qz3yk4R65QsraAg/8AU5dSTdS
MXtNU+3ElWIKxBSoSYEyIc8ZZCZLrvBJCJ8RaiFd+AWca8dBMCvf1eyqrIBpbcYT5cgryVNoZee/
N9pEXD6mQEyB2hQIC7lpvYgqJzjVjMHx2MG3+U2klhxJouUV9c64knrn31S7+RolTOv3KLG/U2pT
2zh68prtu9xm3EBMgZgCIQpoITcLc6A7P+S+TcOh1h8qaVob8PtQ51l/tpZXvj4yT8+10PjksFt4
Pdo9sr6KcamYAjEF6qVAQMh9j/nvIGwc69bQbl1MBn3feSAHD6NijgV+dCBtdUD5X+E0Ntz6blr9
pf8enYbjVmIKxBRgCigh7+g+i2xjrfO9dfAgejC3JUQe02I7Hfa53Ej9ndGJLrtCT9P6A6rvB2Ef
hB9g7K40FdeNKRBTIEwBJeSeEAv6GfVl3x8qkrKux1KgvN9bB8fS2tzgqBMxvfRskgnE0QGjZQrs
DMl2q50GsgOjPo492WC6sAZO0LOx8P4WC+/UPdm135cXaRE0B3zTu1dwaKTT2YXjqHV4MiVHnqfl
OR0ibqSN0Sibzn8dG9rnFb93JkajyZ21IWjad1ppyuYhp5BRmka9C571K/AhlPFJzxn2PQjgP+w2
hFKWjcUEi47MYuCFhvrxmE3KJ6jYqTLxymHO0kOplKg0M+xxSRq4codT3LR+h8/Da/YdtRClrc9g
4m5pqm7NShEFfAGTy5DDML+ZJnatTiASs7sW/11DUNVu/8YYMraxg3dMRXPCNpGtWRyNbhpqw4ss
GeKH1JuZ0VDdJgojbdUyUQ+pq4By5k1bCJnRcdDqS4iJtzTRfv1VUvkB5L3PjsSjVis6A+9KjCHa
6++XkS/TCM2iFvo2xnUO/nZgbEmni5T1G78rAfOBaJLzW9Irgedb0UdY21F178Lnh5xyQmKxQuqu
qvu/+NRRimL2qFrDqeu9N55h+wRa3fWLuuqMZqFUd5qEoXbvPaF9NYu7afEmpeZX0vPYRpinP4B/
T9hreKfyis+N0gvUt/DVZodWbz0Wcs5YOwgU+BV2UAi0C6ncFBLJ/3GZ9q+xWzxQb6NNleOBC6FU
6EaZxmP4HYi7r8nyqh2GOYX9EItnux9ZeutaaPnyEp2OZwe6zyJ35vwdJMVFTeHDp/UMg4UbzsQR
OBMXjr4z0Rtzo7RqanIiKpn527CQ/V1T9BktHGq102G9Gycmf+sUk3QW/D2P16rivJ87N+HwyDsE
WMi9PPTbIVyX+OPSz3fQyMiHa4631LIdAvaCUy61+CQqGY050FYtfNrHpRHGNfMLwGxLajKbNx4v
Hp/qWYHDNR1Y0dfDnqwM3ZkWL3DKydgIPlw+bd0CpvpMZN30klNItqzFuyB97kUfc0M0ntl9PI71
Pg78JuvnrtaRsj6H5/+E59uxMH4btrnOGBT0KYznjsA8PoHvrGG8CTr9ENz+Uf+dgSPAvWVHgNNo
W9I3UEYnQkm6AwLyqRB+qTz3nQQeD6K/C/x3HfnFZItO/Naan4RJUSw3KSBIqWm/VvcQuCBHpvq5
GIIstNvp84SBhKneQMJUugA6yqecmm2JQ+mBeWpRDYK5DBoXdksHxAxobBh/FZix5HAa2/qfoM9E
XUI+iY1PaWcM6cJH0edy53tCvpdKAqcvuWlxqo9LPzYRCiwQpsVaMmvLio/YH2SQMhGCfNWx5DQq
taz0M0H5vaStoPsE1bd1FX7fgG+BBDV7AfV3dfv4ndf9Phox+LRoW3CUWsgN4xIkuNzuDuYSIH1r
sGDN71sHW+GUgyKcm0gtSTBUQ7AYA762OSEvoC9nYt5AGwGBKOtfJ/qMuG8UE1azJ7VTaQ2Y7dyG
RqNNgz+ASVT6LoO59JPgjjud74J+7eAs6TTnt6S7MaF/q8oVvoQHX9V9CqicciyY6dPUl7kNdOLc
Ai1Egt5GfcUMDEHmSVlvoq8A42KhIBwJjiprWt6CUDlcSb8HfvqosU+fBE4hzlOnEM08BE1Um4NH
gBfMI48W/ubCD5hflGnkgRg5wlFlTYtPK04gQ9wC+/WyQH0VkSHagHYPq0QYT8I+Jab5Isyl2hCC
EDpTITbA3HoR9PRsZc1XKetOtIE5xLwRHRygITJF4VNiCCaRdeTGkZ1UF6fo8azGL+YnRKqyahNJ
F26CvClHnALWIhK4kOUTVJz/LxDwe4GPm0IuMEeSE8hOckoGNRTfN+Uc/34Eb2dAG31NC7k9PIsG
FjECbF+6TrBAtzv7atDj2BHOcoqY1s/xeXydNYEkECpm1MrjIXng4AF0V06p17XAtFho4aGUayBQ
0cKYzl+Ofr6GckHny00g8lXU3v1hakl8wunGY6KzuydR0lD5+m32cfRA169qoRF6r7WgtehDX7Dh
PS8NH08rF/1S0bpwCZjqVkwW6JBto/YvwFF0uIpgSHoRz04MtM3REOnTiWm38aXxtO6WYZqLk37b
ksqBKGU7ds6VIZoSvQVceMHh+rw7sUDrBaGj8Pe44ee7zjMBX0VfhpkEjqvAzuMx8MzcIdSa3Oi8
956lrRVoucPF+2Tg7Wp1VhaCkQ/1lbI24tkhzjP7VTg+bwLe2NnNad4CrPFK5Z8GPn+BkpuBv1qs
zPyngeT3Qm0GiBT62mFdBpX9Zv1Mvg0+4cVBgxddktByip33qXEHTC5v0TTz4AmhFiNBP6GhhFq0
+AYkb27H4D6F+zPswGV+hmbAwhgIPXvlbFqMCM+1bjmlTUvRB1lQNPSgIz8DmpGai+HEBP+2pXSh
H/OcAh7PYuGaBppg8RLQagFlmmelkJsFZL1JZL81AP0ZqBBCUjD1td7qUQzprXr1tOELVAlZegvC
WXpcP114C8Rwdzm2wYVKo+0fxMKQsyFkdwP1C/GEhf5KRXQwPLkM72ko9eDilfF3OQOXZMxXl2Sk
Cz8FHhBY+SptGvNev7lJW48g2aoWEZ6clHUPJu5jUZPl19HRBM2UDt7u7ighFMXMM8w1GIvaYRIY
t3eGvyN3MHaY10N96INHEKZMYOcPtGvAvOnt6sPOohOYfAHw+pb3QFBwj4ALyrutFi1bfpAGOp/z
8RTiCiwmWgC18POCpObJtJbh8x/xtx3PxrnPXKGwr8LRZzYtaoNpsfPTM5HgSM4qTci0eGHDfAPY
lAvCxCHlMC0foxBvAm+9k6t2lGYh3GhHe+EIMqTyxQy/AeH8Knb04NkQd47SPetxhJuTz2z0UxlO
8+cUB7k2tykhZpi44zrwMjQ+aEH92YOpHYuB4S4GJNdhIftzr6gWckGX0tuDdwZCZrUJxyWCE6V3
sPrqktgChoLTz4VGnUmzrBOhtP40NBHBntt7/oYMW51ZlwYy9eZvANN76r3aGcptdTVhHLNHDBrQ
qD3eDgEw3Ay+YN1yFbucQp5Go2n4Mvo+poKQ1cYc1AC8flPYxYS7iwVxaV8CHFtUlqF6znygFoOo
S0A8nFroZHoIO3S68BQWrFNQ+jXUVyFHX0sR0FIySkthCKqsHAloATMLQ70vp63vBKYf4Z26e2D2
spMpUfoPfFOC2dFzNdk2bNMmIj7pHqi9tqv2yo9BEJYDb52uXUFs9wHjaebBp7j9iCHKmZqyVoOK
0CQFFqjM/lisXTNJfgv9fM6pdzbCuEk3jKvnCKq1Y3r9GOM7PYQCOwC3BbSbKPwEPYed/IPuHPBm
oTcQ1xQNOt5upREJtcpWK2i9sCoQV5+1VHUWhJbEOucnqzfDJTVYDw4bfpFuDyTXNCrkHViFbazC
1U7FaYHRTMN96+d8IOd9+NO7ROg9dv6gTV0PTUyLHR9/6hQNC7nafYSYS6WSVku9NiUN0UrEbKs5
Qr1y6Z7vg1EvxqoVxi2d78bGzQ4vvUv5jFeBy/14opxljONM3B/Q6t4fYCSOpt55OpRoWrNQSqn+
mzbiENGN27XGAH4pdnY576rNXcpaiLnHruP21Z7HwivUwlsp5O4O7dqi3pj9tqF9eackqXQSNDe1
wDcCWgtSzkDtP1kITSP6HsKBrgcp3Z3CRqE0xehoTA70V+q3diDqueDn7d1fRNSFb0qq1A5I3IXF
ge19DUGfgm1r52awjERIeOUCNgsUpPIfAY/d6/8Grqweume74Wzo7wzaf42QLrqsaT2KF8omrbUj
pqzzHE9tPWX9AcEDLuABl7QJNmDYccNltMC8jv6VDaieMzGVA4zBhg9gwPMBBFQqkgtBk6UNEcLz
Oks4hIoBh5D2Hey8Ta9+NTr4O494BkzBtqo3ppfxBTF4CfWtU6mSZh62rmgD8+Wgvn9Fl/UdZAib
ZlXY1Gd+LCDFLk2bVGHIvx3ImcOA7SywmPVleZcN1C8LVWl185egx/Eh34Ftn0gDXbzQsvf4Aczj
+c73asIv5M0Yy+Uo8XOU4cW5OnB0ojx/oAM8Zrs8ZiNbcKDzUQjFaxCKw/D3E6jgf1m1waDPIYqX
2687hoxWdqYysG+E/T+4/Sirbz8y8wjvwmyS2PCKWdWXaXFZ9klprchHIkBrCd9QsU7fkGnxwqv4
1hHyYCiiliDulKplL8+xDsAwvRz4bnSm7Ymodkw4Ery75OrFQwsxbCepb5zh9qUNOzuxPxaBx9zu
XoCKeQMm8ygQ+XLf8UPwTPdntSMm1X2sr04aUC97G0w00bbtCgjhef5QzfzdmGC2/RkQ9rK/Boad
SgnjYgjRgXBcpp036fzn8dxL6EH2ofwmxgH7qvQShPd6XxhtcQENZNSiqJjFPV8A263fvYTDw2XD
y22Oc06XVTtmic6klVm+r4/rP4xP5UgSrNGBN2y6wg/ptMqj6MHOV6B+B+x51xej6ruhWKjRRNdi
fOPRRAbfVcjHt0udsq6z1HmzFn/Hoj/O1VA2c4WQ5+FhFzp6UE+Gnd6h/w0twhks2LxQGlYwUpDG
4SvpHr4igoZTuhbnOA7BvFwIfpkNXNRhLd0edtzO8I7rFAiWcX5VCq1e8BZByJWX38xjroXnWf8x
6PZdEonTYc/fB54YQL9uHovjcb8apsu/InR3Knjis9AYrqfigoexUcOpLI+hVpmhHa0tKMObq9r0
HCEPprUGV1YP8Wb/NS12OhwROWlRbepDMAUQUV0vVQt25gPw4uHB66rC7XFoxhVueR36/LLzOpWf
B+bscfFmBvXyCGphwxOm7TZjGGrvIq32KiZ4DZ+V4Z4RTNqqzNN+B2nrWfT6Z6EOhYEUzPlana+2
23kCXc12PwM4HuDalmFhYdONY81hhxIjYRvvoYH5Lzn4mHkIrrAq5zWoAYUwH6EtYiI9Ebi489zc
n1BbMpjpNQiaX+TGoDmjUAu0mpP17i3APB23Yq6Uo2xnUJU3YDNv3T7RCfd6kLJWYTGbWdmcXIq+
Fqpx+yG/ymPYXsVgnyHt0C3gvR8sTaFHFqjohKIp/AJCHeP2YAt2fKYZ37U45WiVdl4OXmJXVH0u
OzI4iVblNnkHVDxGfhoExiqxi5DOT8dupBIPJo85iG6/Onyqrbz5YPl6d/FGUeQdaDiJrDrYXezh
3Zsw2zoDK/V7kOyyGh5vFvxoaC+cj/jqOJrU9hDduQf/o4o5S5D8BF/QijozxMqx57CbEK8rD3+d
wCnFnBgj7U6opWoR8cAsLIJwL8bPsI1bT9PTcxNov7ZzkNj6BC3vUhGFamBedwISlU6F8rzW0Vr2
NLC/gmH7jvtCi5CHB6cSJ8Q2Sop1tDwis3N2/gLw1TAlhh4NXvjiHjUtnAang0poiFqBGh2sXtHC
Dq2qxLU4xMI2TH3lG8UnLr/vUICFbm3ZCbBZPWdSi61STssXeXWxCNutBtTT86m40LvYZN8Z0z6O
ScSlEbt4dLGj58sIcbhOHmSi9XfyXW7VIXjQwUYiwYCbSLCPEy5Gr0kKmJYX5mGn6TMwS1hNdpOU
BMJNGRWBMS0Os7EfQTmDJSnHXQwNU0ALeQdULNvNqZViJlQtdsQ0BsHEB6IfYFX2HE3R7Tj3sbtZ
WoTTQf1Zdb9cDO9cCnhqefkIpZyPkBYnvigI2dQSmYOdOnPwnUud3TKysosc86/AAaAOazRjG5vW
86j5Aaf+hoPg0b1Me3Sj0A/e2BpM2dstQ40b3ecowFlhE1rfxN390Rd4cmrpQA07ep8b1L6HUPmF
jDrzqVqa3c7GoGOttdMNg6e8SsiVXunmSu97NIoxiinw/5oClbeuhg46wBIqv3u92nB17HMIWkDl
LRzBeuFUwu+gPCc4xBBTIKbAbqBA9NXKc+EB3ZbU/yGhEJ9ENhDffBINcwrn4lIGdYJNjuBwxMLo
0Mncnim0zVYXUSj4Zwi4upghhpgCMQV2CwWq358edoqpzktlhw88lPxdXOBSwczUCkzn3jCWtg1x
/rO+fELgIru+LLK5YogpEFNgd1Kg9n+SkLIeQ6ij/GaYz+Kyhducm1tNi4/6fcFBMngpIv92TmRJ
vktNX47IKYVjEsdG3uSxO0catx1T4I+UArWF3BFWXCtjGJzjrI+FRhFM0sNYEFigkYscuLnEKyvp
i7Dxv/5HSut42DEF9goF6hNyD7XZeRyoEHyho0r0rwf4aiJDzEH6ZvX7teppJy4TUyCmQFMUaEzI
g13MumEitQ3xBXZ8aoqzlvjge8m5jobkHTRs30erhpGEj9tXYogpEFNgr1Hg/wDM0RMiyxVlqAAA
AABJRU5ErkJggg==

--_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-d0firvfx.png"
Content-Description: Outlook-d0firvfx.png
Content-Disposition: inline; filename="Outlook-d0firvfx.png"; size=99;
	creation-date="Tue, 19 Nov 2024 06:46:45 GMT";
	modification-date="Tue, 19 Nov 2024 06:46:45 GMT"
Content-ID: <e93f10b2-dc59-432c-88ad-9b67a995a4c9>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308FB122C49289902CB22D080202MA1PR01MB4308INDP_--

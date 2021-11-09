Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121344A7E5
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 08:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpKw01MmHz2yPN
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 18:52:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=Selector header.b=fcKmjqZv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.5;
 helo=mail1.bemta24.messagelabs.com; envelope-from=dukh@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256
 header.s=Selector header.b=fcKmjqZv; dkim-atps=neutral
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpKvW0MPKz2y8R
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 18:52:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
 s=Selector; t=1636444339; i=@lenovo.com;
 bh=653/63xZy4SoQmjIrhAQU6XKsnEhNjJYpdVdg3aEYPw=;
 h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=fcKmjqZvz1r4ZgzEdP9XM5bbGaZkRmpGq9AnhqmUj54/c0BrucGvQ0uqwpW2tvsM+
 E+p04v3oQw16eAKzEqjkkQHN5JMus6+qlAwaE1Wk+TXAkfNEmYJ5brc6z7j1bz5ld/
 87VtaUwYADwPbK+pWDmNqLGFQi/uUM9b1jI2XAVtp2c/C3dVUzF/Ap1zy3bb8Fwr4F
 WLk/bhnqj/LLSD92+TxeehHgaDlIPES/fXV4VJj96cDd+DkyGCRWOgTTYwYK/AV30H
 10fj5qvxHYoelYEXBGrkXaC8WoqoCKHEtJkFY7ZXApXRG2FojK9/oooftswLRJTvfA
 pDf4OCmUOPRog==
Received: from [100.112.131.15] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.us-west-2.aws.symcld.net id B6/AC-25200-3B82A816;
 Tue, 09 Nov 2021 07:52:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJsWRWlGSWpSXmKPExsWSoV9rortZoyv
 R4NUGXouTp6ezW5xqecHiwOSxc9Zddo/zMxYyBjBFsWbmJeVXJLBmfP81ha2gi7+i99sxpgbG
 D3xdjFwcjAJLmSU+9K5kgXAWsUosnzqZDcLZwCjR/eszI4gjJDCPSWLvpaPMEM4dRonPn76xd
 zFycrAJKElsfnoHqIWDQ0RAW+L8z2SQMLOApcTmj5fASoQFfCX+X+hlBLFFBPwkjkw4ygZhO0
 nsX/uFCcRmEVCRuH71ITOIzSsQK/H6SyPUrn5Gibk37oA1cArYStxb8pUVxGYUEJP4fmoNE8Q
 ycYlbT+aD2RICAhJL9pxnhrBFJV4+/gdVXyJx6+V6Noi4rMSl+d2MELavxJGXl1ghbC2J69v2
 MYL8IiGQI7FrhQBEWE3i6qejLBC2nMSq3odQtrzEtEXv2SFsGYkHN7aDQ05C4AKbxNGPOxghn
 M/MEjPv3YA6yEBi3rcjUEesF5F48rN+AqPuLCQ/zALazSygKbF+lz5EWFFiSvdD9lngcBGUOD
 nzCcsCRpZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hsYGukaGlnqJVbqJeqXFuuWpxSW6RnqJ5cV
 6xZW5yTkpenmpJZsYgSknpaDp9g7Gf68/6B1ilORgUhLlvSzWlSjEl5SfUpmRWJwRX1Sak1p8
 iFGGg0NJgtdMBSgnWJSanlqRlpkDTH8waQkOHiURXi51oDRvcUFibnFmOkTqFGM4x4SXcxcxc
 7xdPg9IHmhaAiSPgcmWZhB5ZO5SILnqwPRVzBxb+pavYRZiycvPS5US51UAGScAMi6jNA9uGS
 y9X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPtWDWgKT2ZeCdxNr4DOZQI69+CXdpBzSxI
 RUlINTELufBO3pJXNX/9j1/r6slPF6u9/Jey5tShuboLXj2r2M2su5qjVZ1tniS/1Ob/G5MC7
 62bVe2/d/x8fUsTxmSEq/3dIuNucFw48r9+F29Zf0Izkqa+qLN6873RUU+ecn2xrD9vcjLkwh
 1v/rrzF26Lq/1u0CmYtUNww1fFomBvD9WSl657CvzffOpJW48def9LocF1JjbtYnJ1vdoPQlU
 Ct+u/PY9razvK5sV5f4fpPUOCPwMUV3t8T2OfyObTeSqjlYTfaUpBlpt6/9ZLZ6+jzJ69JOu1
 xW9bYmvlh+jsO150uYlEtC/ynba+b9LvKdNFehddqkf5WaTPsH+n//Pzp5+PHIbqpE3ofyxS/
 VmIpzkg01GIuKk4EAFUbEPlqBAAA
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-18.tower-336.messagelabs.com!1636444337!79058!1
X-Originating-IP: [104.47.125.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3670 invoked from network); 9 Nov 2021 07:52:18 -0000
Received: from mail-sg2apc01lp2052.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) (104.47.125.52)
 by server-18.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 07:52:18 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN1TNc4OdVFpLXDlWjnYpPNYAArnc7uRzZqNtOtrqRxyvOjYZu0fX0Lu+bWtTFCvSLkbLqX4Pw7L9j9RveecYzix3pfmujltS28bYbCycdTNTMuWa///0T1Z+nyg6C6FggLkoIZE2ddZEgBgWYM9gRb/mpk0GdCCnaigg/Sswny5aOm3jOTlMc+4zyzlDZZAHVayE0WY6V11muD9jqbUgB4U94S60QmXf2vUK4zi7wU3xT0ivsyOmAHlNdp5/r9T6ky5pRZYq9FFpKl9d/o9nPSfnj9gcnc/VmWMVMGTOu3uLc+a50e1uSITD3VlUIRl/jfZlJb8XeCuwsow7EGvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=653/63xZy4SoQmjIrhAQU6XKsnEhNjJYpdVdg3aEYPw=;
 b=aL3rHaYuhdePZlqhsm8wwBMwYOw4OKV4r10P3X4AMaLvDKkF+k3itMKxPSEE9zMP9IhhgQ8wyMTQPGal8J1khEeRD+vYK6LoDDhfXOtNJmb2Na/CHVoBfHnmn1RveGf+21+41pgYLzIWDSO+gXOJ3hP8b9wD9h1bT5Q/uFQNwXp5tskz51/Ns8Q7eoajcdAnY1tOCrbEQO7pMUQw7dBQvZDrTvwKl9zN31QyyWK8BozVcdnX69JN4/MQqMc5UEaWKdn5+4LLRHbL0ta3g65LnuMeSklTxBbXhMhW0t3yzfivwEIjmAlOWqulisM7JGkUr2f/JHWnH6GoFwn3FrOy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYZPR03MB6078.apcprd03.prod.outlook.com (2603:1096:400:12a::14)
 by TY2PR03MB3312.apcprd03.prod.outlook.com (2603:1096:404:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.9; Tue, 9 Nov
 2021 07:52:16 +0000
Received: from TYZPR03MB6078.apcprd03.prod.outlook.com
 ([fe80::5163:ef34:356:a53d]) by TYZPR03MB6078.apcprd03.prod.outlook.com
 ([fe80::5163:ef34:356:a53d%4]) with mapi id 15.20.4690.007; Tue, 9 Nov 2021
 07:52:16 +0000
From: Duke KH Du <dukh@lenovo.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: RE: [External]  Re: Add member into Lenovo designated employees list
Thread-Topic: [External] Re: Add member into Lenovo designated employees list
Thread-Index: AdTuhggDxQgYQdvVTwKpLnXtmXb1JIRu7i+AAAzR4gArw4WJkA==
Date: Tue, 9 Nov 2021 07:52:16 +0000
Message-ID: <TYZPR03MB607810A7EB928481CAEF3FB5B6929@TYZPR03MB6078.apcprd03.prod.outlook.com>
References: <SL2PR03MB41392EC887269BEBAF453E96B67C9@SL2PR03MB4139.apcprd03.prod.outlook.com>
 <9D88EA1B-4409-4BD8-A341-EAAC8FF0007A@gmail.com>
In-Reply-To: <9D88EA1B-4409-4BD8-A341-EAAC8FF0007A@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d306ce3e-9d1c-4ecc-66a4-08d9a355d9ad
x-ms-traffictypediagnostic: TY2PR03MB3312:
x-microsoft-antispam-prvs: <TY2PR03MB3312D9C02E4710BE2D1B50A7B6929@TY2PR03MB3312.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lw10aA6tod38TDMHOk+orzH6bGPklvl9Sq4OLY03epMh7ilqgr4S6voKrZAxDpecd1J7MuU8P99CgVi7gvRHt0PzkIRaC6lWqSsQyaxumK54LwOJPM7IMMO4k6/X5LJ5qvEUD7HW0lMtd02IN1Wi58wvl/xBaNv0WyuQ4/nbhAnpf5quvEBK8XLyWiovJwqrN2/HCtV3trccbAYLgdYJCz0rE/iQBN6nE9qBdU4DFkMaAsRvmi+kpuFtRCNdVGOiU0Bx5G2wTwP51VM1MQ2Rtd9p2mytqpKQcyo1qrgFf5n6m0gd3tpALsILnbBBvEzpsBYRnjzxnDt40vliSLLuTXzVDO1ekm7QRxsP01cIYM8T7p095PXGf4sMPBjyTZ2KE7HX22tDgTZqj6x3AQjAYtpLC5M7QWe+iDRe2o2+r6iSH54JrNar8L224K7c0FdAkyYvVR6JZGx3wSAahOm0LqKqfem8C28kquddQbxzRed2+/yGb5SOkF6zo58O1rqgb/FxOIi83B3LUwut+f5LfgcCMPSwCjAaJ8i3Oe3NdcLQqC4Bg3V6LoPCNau5duxce6dx1io0LeGTp/Gv2DtsODDZSHFow4cvUD8aPPMSInrnNGz4g5JcrG/si3wS/O03GYaTqZ9/PAgX374dnnyEu+Ec9c6h58Cv4zIjUhBAtooeVIZ27QUB4IhlCn9eswpWOpKc+Bq1IjQo9ogiu2id5KLwccJtuC24qmGyJV4xKj8kwkqRlFcsNjspiGR0E0LVk3MBwT/zOw/hcb3ew/QcFBMnxk0DI3v+im90EnvlNCE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6078.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(52536014)(66476007)(83380400001)(66556008)(5660300002)(4326008)(6916009)(6506007)(122000001)(33656002)(38100700002)(53546011)(66446008)(64756008)(66946007)(7696005)(82960400001)(8936002)(316002)(186003)(38070700005)(508600001)(8676002)(86362001)(966005)(26005)(2906002)(55016002)(71200400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFBBNFpGbVprTitDcVVMWGt5cHNuRHJiczBOekVyQnU1TStIaFhxRWNaOEpo?=
 =?utf-8?B?SVZDSUlybjJZSytkeXpZTGg5ajRCMk5TWEZyVDBIU0Zqb09icE1lczlmdGhG?=
 =?utf-8?B?RlE3OFdVUW91eHVxb0hYRWQzTnNxOHJDZjJ6dXpKa2J0U0NqdDkvTHhwTVBi?=
 =?utf-8?B?Q0R3VzViZ1BibkZyU2FMWmxyQXFhQjlvR3M4eE1PU0dUcVd0NlhKMW1jODN0?=
 =?utf-8?B?ckxLdkI1Zk9wY0h3T0YwMEdrcHdySjJNMG1IR3NYdjBsc2F0R0VSaTFlYjBm?=
 =?utf-8?B?bzg4bnNCaHorTU9ZOVFCUXNWVk9wZEtKY29CRTlhamdFTm94OGRwZ245TTdV?=
 =?utf-8?B?VGQwQ09aa29sK1JEOWwwb09sc1dtZ2l3R0R3RDliT2QyTlowa2tMQmtHaWpL?=
 =?utf-8?B?TGhGS0NuemVEd1hIZUY5d3NNWkdZWU1NaDJWWkpZRFMxbkZqNTRzQWl1UVht?=
 =?utf-8?B?SXU2azhxQnl3bXdCRHFWMTJvcWh3MUdNZEg4UVRnQUJTWU5oenczRDdWaVZm?=
 =?utf-8?B?Wk5JQVRCd3FIUnIyR0dsL3ZSbVk0eEdSMEg4ZGE5MXlFUWFWNTZEVUY1K2Na?=
 =?utf-8?B?NEVpby9ZTkl3cmF1RERHYzIxSGNUbmFnaW4wWFM4YWdrZDRURy9sNjl2cU4v?=
 =?utf-8?B?SDVCZHRUQ2pqOEpVNDhpcjl0OHdiOFRRc0xrYkRhNHFoYkt1enYrWk1Lbitv?=
 =?utf-8?B?SVVQd0xLRFZjQmVnSDZabkhqbVg0ZkxnUEh1ZDkyTUZ4TnJzazJVMmZkZlZa?=
 =?utf-8?B?YzA0OXI3VmxVbElRTjVJbkF2MVhNbTh5enN5OVZ2dTdtNi9xb29Bc2dtRFFz?=
 =?utf-8?B?Yno1TkxWY0RiSzBmTVJ4Q3o2aTdsZC80U25MTVFvUGQrNElzcSsvdDFTWC9h?=
 =?utf-8?B?TWIvU1BiRnFTcE05UXlpRnpiNElIRDBxYkhRK3FTRi9mU0xZaTNWYnhQc0JB?=
 =?utf-8?B?SnhodkJONWo0Y05FTUtwRElxMzJ2WUVJOXlEV096NWpxMTJXS1UreFVLVGJX?=
 =?utf-8?B?VEpGZm5SaVFmY2g4b0xWWjZjczJTdUYwTCt5Rm9EVG9Gc0tiSnF3MFZhRm1G?=
 =?utf-8?B?Ky8yaER3dWVMTFdweVlVS0Ric2xrZWdPN3QzVXQrSE0vMXB5UWdMWkVEbVAw?=
 =?utf-8?B?K1FWbFd1VVg0SFByNzZXeGlRWnlOclBDaXk0RTBiQm1Da1BVVStiQzVJL1lF?=
 =?utf-8?B?UE82aHJhWjgyMmRvSHMxQTE4cXptZkdDY3EvQWQ2VWR1OXRrT1pXSWFzU01s?=
 =?utf-8?B?bjJpT05Hd2hsNE9LOUtFa1BmS0p0K3dQbXNJWk4wU004cGd2VldCWExDVGU0?=
 =?utf-8?B?K085cEdQNzJvclBGMVV0UTVORVVvQlBMNVJIOGVZM3oxN05OZWVPa0M3czFF?=
 =?utf-8?B?ell2TFMrcUZRb1BIaGhMTEhZN21BMFIzTnBnZXNjTDhBQWMwaTFxaDQ1OFJq?=
 =?utf-8?B?ejdQN0dnSkgrdVcxeHFESVdvakdybnhUNXhFenBObXNoQjVJRG9PMVQ5SjBi?=
 =?utf-8?B?Q3BzaUdkSEJaYjlqVmxzdkcxMCs2VkZMWlB4WkRsa3lJY1JaQXdsZGFqZkxj?=
 =?utf-8?B?RDBDU0pCSlJPeUVSVDFuMjQyRVI5a2JjSmdjZXY5T29XVzBwMkUzMFFJQTMv?=
 =?utf-8?B?MmMvamZFMllSN1lQMDlwaTk2QU1rS2MwQjFYVjZRSjV5Tk9EYmd1MUNGakRN?=
 =?utf-8?B?a1hEVmthTEcxZjducFJ5M1BCTTd3Z1FvT1hoY2VBUllIMEJ4MGpDRmQydDVj?=
 =?utf-8?B?Rm1pNmEvTU5IUzdmK0JWZmFrZ1RWS2FqeDd3L0owaHNucHl6VytZcHh0Tkgy?=
 =?utf-8?B?QUtyb0RScUxvakpNWEU3SFFkMEYxc2czQ1ZNQlovcjNPZmJENGo2Yjg3Z1Qv?=
 =?utf-8?B?QkZkaHI1czRWVFYxMDRZTjVieHE5UUlsWFRXRlpNY0hrSjBCeXJmYldiQ0hh?=
 =?utf-8?B?TmYzSEQwZC9DWjBQY2ZqTlZ5ZTdRMXVFc3JoQVlFdnJ2aWZ0VEJHMVZULzBx?=
 =?utf-8?B?OHRtMm16WC9pTUJtVVpTaU14RGgzaGRKaHlKN01wL1U2N3YxQWltYjdKUkVI?=
 =?utf-8?B?bTRra3Q4TFEyTGt3ZlVZNjQ3SWJpL3FCMjhQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6078.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d306ce3e-9d1c-4ecc-66a4-08d9a355d9ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 07:52:16.7590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xm1daNXGrdHrW2AIrAh0/FnIyfM6XgaVWHw3WcbsiGADDe7Seaza9XP5kyBDFUch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3312
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQpDb3VsZCB5b3UgaGVscCB0byBhZGQgQW5kcmV3UGVuZyAocGVuZ21zMUBs
ZW5vdm8uY29tKSBmb3IgZ2Vycml0IG93bmVyIChsZW5vdm8vY2ktYXV0aG9yaXplZC1vd25lcnMp
Pw0KVGhhbmtzLg0KDQpCUjwNCkR1a2UNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBBbmRyZXcgR2Vpc3NsZXIgPGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDMxLCAyMDIxIDY6MTkgQU0NClRvOiBEdWtlIEtIIER1IDxkdWtoQGxlbm92by5j
b20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBbRXh0ZXJuYWxdIFJl
OiBBZGQgbWVtYmVyIGludG8gTGVub3ZvIGRlc2lnbmF0ZWQgZW1wbG95ZWVzIGxpc3QNCg0KDQoN
Cj4gT24gTWFyIDMxLCAyMDIxLCBhdCAyOjE0IEFNLCBEdWtlIEtIIER1IDxkdWtoQGxlbm92by5j
b20+IHdyb3RlOg0KPiANCj4gSGkgTWFzdGVyLA0KPiAgDQo+IEkgd291bGQgbGlrZSB0byBhZGQg
b3VyIG5ldyBtZW1iZXIgaW4gTGVub3ZvIGRlc2lnbmF0ZWQgZW1wbG95ZWVzIGxpc3QgDQo+IGFz
IGJlbG9377yfDQo+IENvdWxkIHlvdSBoZWxwIG9uIGl0Pw0KDQpIZXkgRHVrZSwgSSBub3RpY2Vk
IExlbm92byB3YXMgbm90IGFkZGVkIHRvIHRoZSBzY3JpcHQgdXNlZCBieSBqZW5raW5zIHRvIHZh
bGlkYXRlIGdyb3VwcyBzbyBJIHB1dCB1cCBhIGNvbW1pdCBoZXJlIGZvciB0aGF0Og0KaHR0cHM6
Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3Jp
cHRzLysvNDE3MzgNCg0KQ3VycmVudGx5IHRoZSBMZW5vdm8gZ2Vycml0IGdyb3VwIG9ubHkgaGFz
IG9uZSBwZXJzb24gaW4gaXQ6DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Fk
bWluL2dyb3Vwcy9iMDA5ZWZmYmEyYmYyZTYyODAyZTc0ZDc0OWRiMzYwZDUyYzJhMjQ1LG1lbWJl
cnMNCg0KQW5kIG5vIG9uZSBpcyBhcHByb3ZlZCB0byBhZGQgcGVvcGxlIGN1cnJlbnRseToNCmh0
dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYWRtaW4vZ3JvdXBzLzlmMzNmYWMxNWE5
MDQ5NmMyMWI4NzNmNWY5OTE4YWYxYTYzM2E0N2IsbWVtYmVycyANCg0KQ291bGQgeW91IHJlY29t
bWVuZCBzb21lb25lIHdpdGggYSBnZXJyaXQgYWNjb3VudCB0aGF0IHdlIGNhbiBhZGQgdG8gYmUg
aW4gY2hhcmdlIG9mIGFkZGluZyBuZXcgZGV2ZWxvcGVycyBmcm9tIHlvdXIgY29tcGFueSB0byB0
aGlzIGdyb3VwPw0KDQpJdCBkb2VzIGxvb2sgbGlrZSByaXR6ZW55YW5nIG5lZWRzIHRvIGJlIGFk
ZGVkIHRvIHRoZSBMZW5vdm8gQ0xBIHRob3VnaCBiZWZvcmUgaGUgY2FuIGNvbnRyaWJ1dGUgY29k
ZT8NCg0KPiBUaGFua3MuDQo+ICANCj4gcml0emVueWFuZyAgcnlhbmcxNEBsZW5vdm8uY29tDQoN
Cg==

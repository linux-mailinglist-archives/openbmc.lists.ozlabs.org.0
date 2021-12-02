Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D8465C36
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 03:32:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4KkF328cz2yZ6
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 13:32:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Cbypq+Ss;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71d;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Cbypq+Ss; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4Kjf1pDTz2yK6;
 Thu,  2 Dec 2021 13:32:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVqrzG4KZSPGVhCQOA8Xzf/cVvCCA1m1EvSpx9pFtgxo/51qgIKddXedxiS9+fNIc3IQfmutGkFOpRjzgzDrwZ76GGdyZipqxnkMXEgKZYhjxWkGWJmS0HvquJ7AHeqH/cSQMMZgImloC+lI864SO/Npw2gUVx/xzja0LHSk49xxe+H0QuABzi/+A9xMxQHFZG8PZSX05VsmYjSe4/iLA07n6SHl0n3/XC2+FLwFjx2FMUJx/Icd523WDdUiFhq22U/b1KyqS8vEtHV/fotbSxKLooIL+Njy8odMkbZ2HdL/6dqft/Zk1eIxTB+uHK4f84BoQERqS6Vls3BnYumKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsROCf9ZK+f0rApKQmrLRHInLWf+DOgqWD4yZ/Y2GtU=;
 b=Y4ck53Fbr+uqrRQpundj9PYOmrj/cgkoYKw5MnWQwBA7O4gc1cbeD8EBW4Ykam0b6AftsZshXMPSaVeMH+9gKgt3j0vhdpAM2Tn9zHIztGvyjQmp5WEt5A5tVC5WY+HlMt5z/p+77EKitncGuwGAysqxYX8S1Dcg3jEPJ82+rxQG2uNeVvwWgN2pim6n09UiwnH8l9il9+FLaiqDvFr0TfirG7sucAMGyElmDRUschctYk4IqTlen7TSjPbpltIKg5uOBSl5dCVweRfM3G9XKjVdwXpIGY1M/uv+NX3Go9IiNLyvGhgk1YToNWREKj8FdksOGc9dRvsXRCGbNCoctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsROCf9ZK+f0rApKQmrLRHInLWf+DOgqWD4yZ/Y2GtU=;
 b=Cbypq+SsyWyZ4KzNy1USSC/OIF5f+8wDhhaRuSs/lKOOf03HnnDg7x6UJQezlIrwahpnn9QcJjo77iENJHlDl8VnL0Z2xGGTcclQPxbGdUjqmwzlKRo0EYxmmYM+ju6F+UaxgBbtnSIdldrXbLpqO8j2kG/r5nS23yEG1I02fWjDs+twVM7eJSTo+T7QMHF5P7tVF0UKGvi5dnYKb8p5Qc2fmY7buXs5XP8fMxQSsM5U1Dm7Gg8R6nOobRi/sz3yyl+AxvDDFDeVuXUjwlu2fsacZvMwJ4azTQ/vsKvGeEP0NcPTCM46WjZcMivZmthLaM8tKIjXLVFvDwfbhVhnNA==
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com (2603:1096:4:69::12) by
 SG2PR06MB2364.apcprd06.prod.outlook.com (2603:1096:4:d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Thu, 2 Dec 2021 02:31:58 +0000
Received: from SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::b066:63b0:ffa5:6a7b]) by SG2PR06MB3365.apcprd06.prod.outlook.com
 ([fe80::b066:63b0:ffa5:6a7b%3]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 02:31:58 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Topic: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Thread-Index: AQHX4HPXMbpig5e+0UWtpGOsbqQ2CaweBD8AgAB6DwCAAJB0gA==
Date: Thu, 2 Dec 2021 02:31:58 +0000
Message-ID: <4B35121C-3BF3-4EF2-BBE6-AA76FA1920E3@aspeedtech.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-3-iwona.winiarska@intel.com>
 <DDB2E224-472B-41CC-A5C6-BEADB4BF2041@aspeedtech.com>
 <20211202015455.GB25091@packtop>
In-Reply-To: <20211202015455.GB25091@packtop>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e01df356-5873-4f19-a3a8-08d9b53bea20
x-ms-traffictypediagnostic: SG2PR06MB2364:
x-microsoft-antispam-prvs: <SG2PR06MB2364C0ED1C82F5C51B66ABCA8B699@SG2PR06MB2364.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qcMlOpz+MMYULzaO1BNiAHFneTGQWqpnp0CWn1liiZqC5QfcnmW1FMpJlmJ9ocm2LjYWfpUjhJ3sfArFCSchqfSbHZw4trLRIu3MtljdzWo64okUziLuY4/4OOWw29sr416GdrK0/MVBM4nmW4u9qkfqRn4ne5N36h9byv6Fs3TBYqulJdURGeqCURRKkdblnQXTyQlcjGet67vBWQP3h1YyktAkgs19j8b2Owidy+qlWQTALzyU2v847k64FR7wNQrq13n9lroPSy2geiU946V3Va9wcyMNZXGSKXlFNhhEOH7ckBbEsqtIVI+vrQkFextef1VHoAWtPTSLB9uYU3rGa3M8W8QZm0B4sxT+Ns3He9poFYImoRtUJXAkpuAYTvfNXWApTvzRlrrhFILBE5cCguOqMwDmxZgq4Qaa/pdMznkHQcxHrT9KOmaqaSvpm3OOepvjSeABhxfybfDvfTOj3vlLhDG/QzcCnz3bsKvEThoSwH1h1YXrlcQ5iTnkjAId88mizFK1ROEgi4YEbux96aNWuDok3OiFOSa7mQFSoYo20afABRqJiYSvNbo9IsDYO0IFXDvHpS6NUXetln2/YG+zozI9gN/LU/l9xB25GsNeRPyPLljzvdRpK3WgetDZvPAtJU2KSOs5Wk/fpW3hnAkk8batS09ixNjtViM4VuJtkIOv4NTnMwo/aXacHObd1OIk27KSwvsmRpOFJbVK7x710flwbjC+SzwLVApbKgEQHyJrClwRJtPcEYJd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3365.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(136003)(376002)(366004)(396003)(66946007)(66446008)(316002)(91956017)(64756008)(33656002)(5660300002)(76116006)(7416002)(66476007)(6486002)(38070700005)(54906003)(86362001)(508600001)(6512007)(71200400001)(186003)(36756003)(8676002)(4326008)(53546011)(66556008)(2616005)(6916009)(38100700002)(83380400001)(122000001)(26005)(2906002)(8936002)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUJ6NVV1U3FPNkxXWWx3TmtTaElYT2VqdUdlWTFyTG9xL01xQ1REODNkSllT?=
 =?utf-8?B?bkdkQyszV3BzN3llWDBNdmRtR2ZBN3UreW9obnNVT0JIUDhxcFZsdjd0RXhp?=
 =?utf-8?B?RlkvTG9mYnNQVUFjU2NkSk53NC8zWDJhUGNxbXhHQUJqaXVNSVRvNXY5MnAw?=
 =?utf-8?B?Ky9mQkJ3QjlRVXRDaHg5cGZnWVV2VlFQSHc3NzlFeXdTczJMWXpYVzRTRExr?=
 =?utf-8?B?dlRWSkYvbWFBR3IrdlJlOENNZk1hR1h4WGpXMHorVnhZRHcxMWZ5cEVkd2h0?=
 =?utf-8?B?NXdvSVU5VngvS3lOUHh4RmNHVE1YVVRBSndaWTEyalF1ckZONWFTTkRYdWVm?=
 =?utf-8?B?RnFienVpbVZsU2hSSG54bEtrR082anRkeFpKRXNmS1ZkWUZHOURyTWp0Q0Z6?=
 =?utf-8?B?T3lGL29DZU5Id2RmVmV4TDc4SEpDTC9RWEpPV0Y1aVJvR2pKT3dJZ3pGWjZJ?=
 =?utf-8?B?ZmU2OGhlWHNMVXM3dUMrVW1SL2hpcmRrYWJmY3YyZU8rVngzdEx0a1lBWTJS?=
 =?utf-8?B?eGNIaTNsN0NDalh2NTFjQzJUbFFIdlFxYUFENFlQV0NlNUt6Wm5MT0NBUFZQ?=
 =?utf-8?B?dDkwOE1uczVTRDd5bmsrK3k1aHc2bzNwYXJpV2E0MExadnpSRDkvOWd0c1Ir?=
 =?utf-8?B?dDl5bWFMRCtuaDBHdG04ZUEzNUFHZ1hSY0QwekJGaHd4ck1TY2dydDI5S1Zq?=
 =?utf-8?B?Tzhid1MzenVkUk1rQmpIMlk5SFhjRWgvMmxtU3NIS1BMNDlNZENNWHhzS0pR?=
 =?utf-8?B?SXlMaTFvdU9SbVlRQmtQYndCOXlkMFRjNzV2dWR3ME1wYlZhZnBuK2dTK0xi?=
 =?utf-8?B?K25rT1FRRHRseW1TMlNJS2QrWVF2bHUvcTVwNUM4V2VYaHNaUXhwUk1RQU9T?=
 =?utf-8?B?VW8vUHoxRnpqWEpzQ0xKOWVya2dCZG1BVU9WUTBtWU9wV3E4N3k1anpLangx?=
 =?utf-8?B?UXRUZXJMRWd3TXU5WmVqTGtiUjZ3WDBvZC9VSGFrNHdaZXdnbWdOUmVmQmFG?=
 =?utf-8?B?anl6R2xESFpsTWdIeHpmWHM1YVd5U2tMMHNHc1d2c1A1OHV4ZmxjSXlhUk04?=
 =?utf-8?B?REl2cjBUeStoeUY1ZElrTEtCRU4zTFVZMWsvd003djh1SFZSL1dBSThGbmJ6?=
 =?utf-8?B?djB6dlVITDhDTWdJTmpicnYybmwyMXJDSTZpVlhhUi9kdEJ0RWxNSGM1MnFZ?=
 =?utf-8?B?eWo3dWJKVVl3Q0F5QUFnMW9kd2ozUjZwNSt6NTczNXpwWnNiOWFxREtvSlIw?=
 =?utf-8?B?QVZOeVA1bTllR0pUaE9hckZHRTE5YS9GTW54S2hlRkRnMFY2L1hRRlZkbXV3?=
 =?utf-8?B?QnBnaUxNTVk5N3V6VXZYQk1jZmd2QVltRkRaUjgwU1VFSmp3eGVxdEdVZlVQ?=
 =?utf-8?B?Skt3czZhSm1MR1pqdzdUbVVnZW5QeDQ3b2UxcWRWNVVJVlptRFJXMWtBbHZS?=
 =?utf-8?B?SVZ4YjdUMFc4UitteUZnYk8xdEJiOS9MOU5XLytyTnU5MkFSdTcwRkdocG81?=
 =?utf-8?B?UnFhdDdId1RCa1BSTG1EK0JGSFpQVFpZallieUJXZXcvbFUzU2ZTLzZRK2dB?=
 =?utf-8?B?VDdnWnNObE9EMWpMNEs2d3pUbGpITFhlcExscUVLQlZyU2dCZ3RPV2hEQXpZ?=
 =?utf-8?B?S1JITDk3bTNoRVpOVEZCb0QxYXZCbWhVdnpFZTNBbmhNditNZmxROEx1bWxP?=
 =?utf-8?B?bXM3WS82RWRTRFRtWEQ2U3hTcTUxQzRMbGRIYUhYMjFvU01WS2xkQXpVbEFu?=
 =?utf-8?B?OEtYQ1VqM0owMU9RWlcybmdyYkh3WTlZSVN0TXQ0U2UrQmhFMWoxSjFZVFZS?=
 =?utf-8?B?bm1aeXZwOGxqM1U5N01aZlJuWTI3ekFpdUhEL1hqeGszR0RpekR1OHZGdjVM?=
 =?utf-8?B?bi9ERDRwakxkK244NnFMbXVPTFhKbFp3UWlpRzU5V3N0T2hoMWNHaHFGeDNG?=
 =?utf-8?B?SS8rWFhUSDJTZ0UwTjRFakxVY25zZlZycUI0TzhXMGp5WE5JVHVuYmdoVmhY?=
 =?utf-8?B?Mjg1eHFReCtOWXoxVFdJcW5tanFxVmg5Q3V2cVh3Z0J0ZlVDdmFrakpJazBo?=
 =?utf-8?B?anJUUk5qYU9XQzdFYU91UzFMOWl0dHJpOFd4a21CZW03amJPVHJRMmg5VXhZ?=
 =?utf-8?B?U1pTRXRhOFlPRU5SYWxnbkhRMEI2a3RGYlQxVEtUSk4xc3ZGUStCZ2djdFVW?=
 =?utf-8?B?cGk2emVjYVBEbCtVRHY1T2NXamtCcXJrUTQyQUhTbU80WFZ4ZWVqaTIzL3J5?=
 =?utf-8?Q?yfXKi3sf2ZeGEZnRNvQotaBk4H4c8Dnq+JwGC/eT1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D5B21A72CB7F24FA7C900FFA83C05AB@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3365.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01df356-5873-4f19-a3a8-08d9b53bea20
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 02:31:58.3082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvjePIbzpIOUKMnAZpCMrObgYPYXjGqwN4G+w2kxTXhGtlZ5acPqL7WDzKpiEOilYBsi+VVfxBANtI+Qo1mrf9fH0v9s8EvC4LGjmyBv1sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2364
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Rob Herring <robh@kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgWmV2LA0KDQpPbiAyMDIxLzEyLzIsIDk6NTUgQU0sICJaZXYgV2Vpc3MiIDx6d2Vpc3NAZXF1
aW5peC5jb20+IHdyb3RlOg0KDQogICAgT24gV2VkLCBEZWMgMDEsIDIwMjEgYXQgMDI6Mzg6MDRB
TSBQU1QsIEJpbGx5IFRzYWkgd3JvdGU6DQogICAgPiAgID5IaSwNCiAgICA+ICAgPg0KICAgID4g
ICA+T24gMjAyMS8xMS8yMywgMTA6MTAgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBJd29uYSBX
aW5pYXJza2EiIDxvcGVuYm1jLWJvdW5jZXMrYmlsbHlfdHNhaT1hc3BlZWR0ZWNoLmNvbUBsaXN0
cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPiB3cm90
ZToNCiAgICA+ICAgPg0KICAgID4gICA+ICAgIEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3Ig
dGhlIHBlY2ktYXNwZWVkIGNvbnRyb2xsZXIgZHJpdmVyLg0KICAgID4gICA+DQogICAgPiAgID4g
ICAgPiAgICsgIGFzcGVlZCxjbG9jay1kaXZpZGVyOg0KICAgID4gICA+ICAgID4gICArICAgIGRl
c2NyaXB0aW9uOg0KICAgID4gICA+ICAgID4gICArICAgICAgVGhpcyB2YWx1ZSBkZXRlcm1pbmVz
IFBFQ0kgY29udHJvbGxlciBpbnRlcm5hbCBjbG9jayBkaXZpZGluZw0KICAgID4gICA+ICAgID4g
ICArICAgICAgcmF0ZS4gVGhlIGRpdmlkZXIgd2lsbCBiZSBjYWxjdWxhdGVkIGFzIDIgcmFpc2Vk
IHRvIHRoZSBwb3dlciBvZg0KICAgID4gICA+ICAgID4gICArICAgICAgdGhlIGdpdmVuIHZhbHVl
Lg0KICAgID4gICA+ICAgID4gICArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMg0KICAgID4gICA+ICAgID4gICArICAgIG1pbmltdW06IDANCiAgICA+ICAg
PiAgICA+ICAgKyAgICBtYXhpbXVtOiA3DQogICAgPiAgID4gICAgPiAgICsgICAgZGVmYXVsdDog
MA0KICAgID4gICA+ICAgID4gICArDQogICAgPiAgID4gICAgPiAgICsgIGFzcGVlZCxtc2ctdGlt
aW5nOg0KICAgID4gICA+ICAgID4gICArICAgIGRlc2NyaXB0aW9uOg0KICAgID4gICA+ICAgID4g
ICArICAgICAgTWVzc2FnZSB0aW1pbmcgbmVnb3RpYXRpb24gcGVyaW9kLiBUaGlzIHZhbHVlIHdp
bGwgZGV0ZXJtaW5lIHRoZSBwZXJpb2QNCiAgICA+ICAgPiAgICA+ICAgKyAgICAgIG9mIG1lc3Nh
Z2UgdGltaW5nIG5lZ290aWF0aW9uIHRvIGJlIGlzc3VlZCBieSBQRUNJIGNvbnRyb2xsZXIuIFRo
ZSB1bml0DQogICAgPiAgID4gICAgPiAgICsgICAgICBvZiB0aGUgcHJvZ3JhbW1lZCB2YWx1ZSBp
cyBmb3VyIHRpbWVzIG9mIFBFQ0kgY2xvY2sgcGVyaW9kLg0KICAgID4gICA+ICAgID4gICArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KICAgID4gICA+
ICAgID4gICArICAgIG1pbmltdW06IDANCiAgICA+ICAgPiAgICA+ICAgKyAgICBtYXhpbXVtOiAy
NTUNCiAgICA+ICAgPiAgICA+ICAgKyAgICBkZWZhdWx0OiAxDQogICAgPiAgID4gICAgPiAgICsN
CiAgICA+ICAgPiAgICA+ICAgKyAgYXNwZWVkLGFkZHItdGltaW5nOg0KICAgID4gICA+ICAgID4g
ICArICAgIGRlc2NyaXB0aW9uOg0KICAgID4gICA+ICAgID4gICArICAgICAgQWRkcmVzcyB0aW1p
bmcgbmVnb3RpYXRpb24gcGVyaW9kLiBUaGlzIHZhbHVlIHdpbGwgZGV0ZXJtaW5lIHRoZSBwZXJp
b2QNCiAgICA+ICAgPiAgICA+ICAgKyAgICAgIG9mIGFkZHJlc3MgdGltaW5nIG5lZ290aWF0aW9u
IHRvIGJlIGlzc3VlZCBieSBQRUNJIGNvbnRyb2xsZXIuIFRoZSB1bml0DQogICAgPiAgID4gICAg
PiAgICsgICAgICBvZiB0aGUgcHJvZ3JhbW1lZCB2YWx1ZSBpcyBmb3VyIHRpbWVzIG9mIFBFQ0kg
Y2xvY2sgcGVyaW9kLg0KICAgID4gICA+ICAgID4gICArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KICAgID4gICA+ICAgID4gICArICAgIG1pbmltdW06
IDANCiAgICA+ICAgPiAgICA+ICAgKyAgICBtYXhpbXVtOiAyNTUNCiAgICA+ICAgPiAgICA+ICAg
KyAgICBkZWZhdWx0OiAxDQogICAgPiAgID5JIHN1Z2dlc3QgZGVsZXRpbmcgdGhlc2UgdGhyZWUg
cHJvcGVydGllcyBhbmQgcmVwbGFjaW5nIHRoZW0gd2l0aCB0aGUgZm9sbG93aW5nDQogICAgPiAg
ID4NCiAgICA+ICAgPmFzcGVlZCxwZWNpLWJpdC10aW1lOg0KICAgID4gICA+ICAgICAgICBkZXNj
cmlwdGlvbjoNCiAgICA+ICAgPiAgICAgICAgICBUaGUgYml0IHRpbWUgZHJpdmVuIGJ5IFBFQ0kg
Y29udHJvbGxlci4gVGhlIHVuaXQgb2YgdGhlIHZhbHVlIGlzIEh6Lg0KICAgID4gICA+ICAgIG1p
bmltdW06IDIwMDANCiAgICA+ICAgPiAgICBtYXhpbXVtOiAxMDAwMDAwDQogICAgPiAgID4NCiAg
ICA+ICAgPkFuZCB0aGUgZHJpdmVyIHNob3VsZCB1c2UgdGhpcyBwcm9wZXJ0eSB0byBjYWN1bGF0
ZSB0aGUgYXBwcm9wcmlhdGUgY2xvY2stZGl2aWRlciwNCiAgICA+ICAgPm1zZy10aW1pbmcgYW5k
IGFkZHItdGltaW5nLCBpbnN0ZWFkIG9mIGV4cG9zaW5nIGhhcmR3YXJlIHJlZ2lzdGVycyB0byBk
dHMuDQogICAgPiAgID4NCg0KICAgID4gICBPciBwZXJoYXBzIGp1c3QgJ2J1cy1mcmVxdWVuY3kn
IGEgbGEgaTJjLWFzcGVlZCwgZ3Bpby1hc3BlZWQtc2dwaW8sIGV0Yz8NCg0KSXQncyBhIGdvb2Qg
aWRlYWwgZm9yIHRoZSBjb25zaXN0ZW5jeS4NCg0KVGhhbmtzDQoNCkJlc3QgUmVnYXJkcywNCkJp
bGx5IFRzYWkNCg0KDQo=

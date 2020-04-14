Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EC1A71AB
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 05:18:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491W0v27KrzDqBg
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 13:18:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=2a01:111:f400:fe4d::631;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vertivco-onmicrosoft-com header.b=oFA3dxr9; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Vst6Fq9zDqGM
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 13:12:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY+/LOlCJWl6GaK3J5ytP+Mzj7RP1NF97CcYwHGA5ZPybZdVwU14EPKkvluq4chKye8fOYGERCdQ6Rr9tIP0zL7Jrsjgb4P0an0eYpZblDeAYuQ/SQkZquJC2auhIanoJBjgNbOaua4cHRUEnvGF7IeAzy4X5g0gQnjpPyOiQ16nKszkl0jM3w11JHGV+18H1dky0e0LJ5lA3NsjvHMOptSR7WidbGnL0Jmsv4d7SkKnUiLOVdL7x5dlEuLKFmkZu2mPtxuDtmF+hfZR/2fKznmFj9P22YPbTK11CmgN+Hjkl+KdKpEj3AWO/rU+OgUd/Oam+LZPn/mkYYNsfOE8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC7Web4nmTiUSLBme3M8x64xXxrm23rzZNBCL5P6qC4=;
 b=iYcxVVdlKSXSAi1DQwrKmn67y39OVoOia3sjRzUL9blr/umyh5Nw8EoXDvzKUz0mltYO9KVdurkluxxkjf8Aez9u+DyLSjfDAfisiRktAeggXOF4YkEmrlC4mutQSyahm7jCew5ZryNn5UgDI3IytZPARdsQGyKME6Ut+t8Y1M/MR78g9PagLwxG/1ENl3/xlHovmP+2sVzHO3d8dxDF0fFW8cIsldcMqGuzNBFky/axDzy4NtOWvJcfpWhWmFZYdoMP5s80BgVgu1LcLXNl6O8Xtn0fnRzPZtMbQYsH6XfuSFxn/hIISGDb0Aw/oO8xh2ba9lOFA6kTu+6o9KefMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC7Web4nmTiUSLBme3M8x64xXxrm23rzZNBCL5P6qC4=;
 b=oFA3dxr9bo2uCqEOkE/yLi9qb4DPn0FiKq+WwU2SMyCfYCtjq9IW8bAXTX4YWYEqj4yxl1o9eSiNhTq8mlpUCxmN/rYbFM2scDQ7uOmUuWOiH2BCYddeNyoSJxARbREV4mdxMgbcSX2JyUfziNeUWQh/7eqzVPlSPG72nbSTwv4=
Received: from SN6PR13MB2480.namprd13.prod.outlook.com (2603:10b6:805:58::31)
 by SN6PR13MB2269.namprd13.prod.outlook.com (2603:10b6:805:5f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.20; Tue, 14 Apr
 2020 03:12:43 +0000
Received: from SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26]) by SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26%7]) with mapi id 15.20.2921.021; Tue, 14 Apr 2020
 03:12:43 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka
 <vijaykhemka@fb.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: RE: [ExternalEmail] Re: Sensor history
Thread-Topic: [ExternalEmail] Re: Sensor history
Thread-Index: AQHWD3tbpXrEfh8YmEiVUlts8003SKh3iEAAgABoYJA=
Date: Tue, 14 Apr 2020 03:12:42 +0000
Message-ID: <SN6PR13MB2480B6E14D4BF7F801B9C9D9EDDA0@SN6PR13MB2480.namprd13.prod.outlook.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
In-Reply-To: <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91c9c5a6-f3df-4cc9-2f95-08d7e021b2a8
x-ms-traffictypediagnostic: SN6PR13MB2269:
x-microsoft-antispam-prvs: <SN6PR13MB226967D73ABCE3D6BCBB3046EDDA0@SN6PR13MB2269.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR13MB2480.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(9686003)(316002)(186003)(6506007)(53546011)(52536014)(7696005)(110136005)(33656002)(4326008)(26005)(2906002)(66946007)(71200400001)(76116006)(66446008)(81156014)(86362001)(966005)(55016002)(478600001)(66556008)(64756008)(66476007)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wV6y5GdX2q2C8YgtEOJp/mvNH1eAz5c99NVtJPOL/SCQaDGUbHsifUQM7J2YaN0dXj3nsFsL3JN/fuFLtZ0l3X+lWr2K9lAarcOkO/5MPI4CiqgoNis2kZeI12HDWfzNEHxErTrsYZjinMCgCfa0ewApvMT7o65rY0REITzAq8eeTx217frXSpGDtW8QwicTDiK8824PYBq7dvN2RIH6JmmFLssHkMS8MdBGz0qmnmKGrYUUW4AFKkKmJetwmZs6TZogu1vPt6Q+D9vTNeexou09rLYApQmfwHvDNv8pbmmvbmefv4kWNL3/0Fq2xAjGSASv4Kbdy1JHC7F20He7WsfYcd/Hs5Q23uzhEP3paGpPLdAYVhyrh7/x/fJWdWH0+YNpWZvj4ykxtLVw47KK0HKcM1y5qSWp8rmfmLAaGrWJa49uV+3ht8KHa6vciQ7ZI/9BgilopGJwzk0zu2FhWJAyvSH/bpBFueXGw9P4YzM3ul9fSVJmqnPnaEN0ykqMaI1VONJ9g6IHm6oIWlvB6A==
x-ms-exchange-antispam-messagedata: loK+w8QrUjKbNDWPOunNT6dJ3fwAqMLOb5PDjoTxRdsQ2mURlV6TVdrFsjuRn+RGNFHc03E9OTYkBWzx2vR5PFvhsxKFL71IqAY8Fsv9z3+qXZec1N1XDvnbe3LXsSPepaF4mFe07lRqb6eS0hsGQQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c9c5a6-f3df-4cc9-2f95-08d7e021b2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 03:12:42.9885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMeJvJa8LvEhKSrxdUiuj3qDEOxdDlcwbMLvFGmio4PF4qK2/FI3r6K94fae0FpAk18roVCtgXeCE0Pl52f8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR13MB2269
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

Hi Team,

There is a telemetry proposal in docs and repository.
https://github.com/openbmc/docs/blob/master/designs/telemetry.md
https://github.com/openbmc/telemetry

The proposal seems promising and complete.
What is the implementation status?


Thanks,
Troy Lee

-----Original Message-----
From: openbmc <openbmc-bounces+troy.lee=3Dvertiv.com@lists.ozlabs.org> On B=
ehalf Of Brad Bishop
Sent: Tuesday, April 14, 2020 4:39 AM
To: Vijay Khemka <vijaykhemka@fb.com>; Vernon Mauery <vernon.mauery@linux.i=
ntel.com>
Cc: openbmc@lists.ozlabs.org
Subject: [ExternalEmail] Re: Sensor history

at 5:00 PM, Vernon Mauery <vernon.mauery@linux.intel.com> wrote:

> On 30-Mar-2020 08:02 PM, Vijay Khemka wrote:
>> Is there any implementation for reading sensor history. Please point
>> me to the repo or code base.
> I do not believe that the BMC is storing any sensor history.

There were some interfaces added to the openpower namespace for this kind
of thing.
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/org/open_po=
wer/Sensor/Aggregation/History

The application implementing them is in the phosphor-power repository
(power-supply).

> To get this, you would need to poll the sensors and store the values on
> another machine.

To implement the Redfish Telemetry service would we need to store them on
the BMC as well?

-brad
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.

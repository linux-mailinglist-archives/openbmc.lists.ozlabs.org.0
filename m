Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283E283DCC
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 19:56:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4pC16hNVzDqll
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 04:54:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febc::70e;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4pBH64smzDqpq
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 04:53:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR8+RK7TGfZfKZusRlLez3EoUK0JPevMVTzcMd6TiH4=;
 b=l4nksChSTSA49vfG7BoSNBSEZC7shKFUXtYmhPspbo2GD5d8GRc+j9o6m8IvJD73k1DJyRR/mzCjTuBfNugMmH0J3gzv70QuZVUHGnBoDUMD3a0gddL0DAyTtSJKKZoTHMP0F3LRXKD0OZ0xdPeZOUCvggZWIus3qGJVA0TPCcA=
Received: from PU1PR04CA0014.apcprd04.prod.outlook.com (2603:1096:803:29::26)
 by SG2PR04MB4058.apcprd04.prod.outlook.com (2603:1096:0:1::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.38; Mon, 5 Oct 2020 17:53:13 +0000
Received: from PU1APC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:29:cafe::55) by PU1PR04CA0014.outlook.office365.com
 (2603:1096:803:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Mon, 5 Oct 2020 17:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT058.mail.protection.outlook.com (10.152.253.17) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 17:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTRk+okOc/0XC/j0zpS662UyOAMvhz+a7Q9qb5HTQIi1DCoVNKyG15kIp8479eIOaq1h6J0DNxLFxzJ72EnC+I1fS1hwr52gHTQ+DOT8nXfLVKXVkYjCZ5qkIdyX2xda99DLgswHYn/oQVJevdD8UW3YwBKP12mt39p5ijtZDQ60/bCTEIUFZvjrMQRt77AY6as/9OOiRYuE4Mh49HnXhg9OvHNnzZEjjisnj7VcBvQ8MBf8lSREwOaBMleYNIF7dbYJlLcPijyVx+KSPfF4RR9fPPlUz7fqu/O2vN+5huIv7/KIpSMQ23KmKv/+rDIG+GK8xSX3UJwGE56uwQVnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR8+RK7TGfZfKZusRlLez3EoUK0JPevMVTzcMd6TiH4=;
 b=CyvWpg8Pv4BQ7h7wgwa9KG8CSQjARP2wvh79olMlqYBTaef5GaiRJ/zOGHKdi4wCcxkbWbBAuAudG2f1Qb0jjuxEGQMahim1et2kLnBUQ7cY3MWoJMTLyt25x39zRdxOYYyG4Ojy1FjsrhpBqPT037aMnf3K++Zt5zde+AySd6uWniuXnNUgZl57wXvMDnkDSRM9gLUzqMpMsFSML04xCzzcCgWgkFGTNPa2K5JTj2WFBRVNu36530iauvpH8wTR/CJS67Hl96kcVZjmfFOF8Qwc0opEI1dDZPokol8twjkZSuVV+4CzKKKAUPn77+auYirskMP6/pih/T4d8J8wDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR8+RK7TGfZfKZusRlLez3EoUK0JPevMVTzcMd6TiH4=;
 b=l4nksChSTSA49vfG7BoSNBSEZC7shKFUXtYmhPspbo2GD5d8GRc+j9o6m8IvJD73k1DJyRR/mzCjTuBfNugMmH0J3gzv70QuZVUHGnBoDUMD3a0gddL0DAyTtSJKKZoTHMP0F3LRXKD0OZ0xdPeZOUCvggZWIus3qGJVA0TPCcA=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2812.apcprd04.prod.outlook.com (2603:1096:4:25::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Mon, 5 Oct 2020 17:53:06 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3433.040; Mon, 5 Oct 2020
 17:53:06 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Firmware version under IPMB sensors
Thread-Topic: Firmware version under IPMB sensors
Thread-Index: Adaa20OW/+EXJZ2dS0eTjnxobOGmeQASBjKAAAK9sbA=
Date: Mon, 5 Oct 2020 17:53:06 +0000
Message-ID: <SG2PR04MB3093F45D8E9B246CDD6D7143E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093F4B562F454122B7F4596E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX83t7k5iVRAsL+7EcGr2QL3LgbM2N09iOiro747cMqDe1w@mail.gmail.com>
In-Reply-To: <CACWQX83t7k5iVRAsL+7EcGr2QL3LgbM2N09iOiro747cMqDe1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMzE4ZTE0OTUtOWIxNC00ZGZhLTgyYWUtYzYyOTFhZDk0OGJlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoibjF3R1ZcL3M1a3lGT2tLS0daMDkzdWtETjBZU0dXV3BwTTJ0ZlBtK0dcL0dwK3JQaVdPdVRLMXMyWndYRU9yYXhwIn0=
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:381:c1a3:f972:360d:9d73:c99]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: afcf2b28-b7c3-452e-ab9d-08d869578760
x-ms-traffictypediagnostic: SG2PR04MB2812:|SG2PR04MB4058:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB40587CAAEEA76C567079F5DDE10C0@SG2PR04MB4058.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NIpuWAI2KYP+fKcBkm+xNutclkZ5YflJhjagzjXLAosSZTKHgj9LhHPZ6VK5FnxP4KzFNGnZrmPavQdSv0MGRh8+nq61GgTqplgoZ1WiQvpvRWbCFfKn2V2Ux6/ibThsS038SMD7dSoVCxuIeV17oM4FWt8yaB++IvXXm0eB/S4F5giwtOaLFkNFq6yhc9HSTmwTmo6EYxFyYEQOc5UvydcnHy09t4H2LjehcpP0mdUTbHyEbKAyXMGVXqMLC4JMaVu3H4sZNqb7EP0Hi/rOI9nJWQcZg6F0fj6vIpBPDInbkmW/wSXuO05pnl5SQU+XsxO8qjULcn1IkOE8yyZGaQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(478600001)(8676002)(316002)(5660300002)(55016002)(52536014)(6916009)(7696005)(2906002)(83380400001)(8936002)(9686003)(66446008)(64756008)(66556008)(66476007)(186003)(86362001)(66946007)(76116006)(4326008)(33656002)(71200400001)(54906003)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Jps8AYg+kLsIlG8Zv6K0bdj/1rAqght4HqTSP1z5WunuusJzIdD6i9AbNmcjZhTQyQFx33Gj6vEQr7iUhbEoKlvH0cDLbdqMjv1EZSohW+y126IF136rGv4Sr1YYbsGQlIXQaTFU0AAdd/PHD8gKW6RZDv3dL1hAThKvFt8cQSOcIGRa8hd4ne8Q9mFcUfW9UXbgKzsdR7esuQbZ/X4pye8FO8EfAA8lUfslOBv1ejx6p2JHg0kjJtpQjxiOshNvWSZOT6aNQT7WwkJO+1+Mp2MEXc12/yjamVmGaXgGluHnhoaOgc1uY50FUdZLe4epHusbV+m42D52WWvPURQyn591LfQI6wL9AuIef0atF9gJ6/ftFicUciz7x2WyONS8/jA3ZdcSai0sSk7WgaxX09hcw7Dmd5KQs+kmkPunAKTGNcsVf51K3OQS8JoACaBmWslAJf5gSB7nj4+paxDlSgJXA0efGv6NM338va5ZJG9RAFOjWtwBxMv3gNt7cQiRksSfeofRvrSKCDNicpbXeJXhg/JnrxiC0FTQgpFZ3GhG3Dupiv2sz4t5hb/wqkr42FzgGqvnHNo6/aJT0gGoYfqGHKX4mCNf2yPiT070bDu/Wo81aLnivbt2hT/arSApDQd0TeTi/rJCijZis/1DpY+5Sh23X8VRTLbf5ytiGVGlX2/gs+8ZUfHWHTls/3LE4ydRz+ipLQAljjDAzHFn+w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2812
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 695b1bc0-b21d-469e-1466-08d8695783a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GEOmsc6hqb6XrSQWFeoDeCce7zx+VuVCu3HG0+Gbysa8sSSduMcrip22N7+OyUmnOUulQnwNVvpxQBVcKyrqrVqRfQdml969Xdf8SJvHIbw6Way+FSPoggdenyCGrlGJaRT3NVZzJutfO4H/Yjgn1YLBJwlcE6jLSvY7eShc1EpYFYBTKIJFnZ+fvlAQoFxDtGsw/MoFrTkpAlOUUgTFEJG/jlDl2EVgrkjskqMLCT64dHh50xov4Xlhr8MXnAGPlCJu88XZ8kEUZ5FHMnUy/V60SgsF0vra9ebRvMbb7IQWjJcjBZWQposQ2AS4FPi32QCMkK2sr4xs/gmoziHg02ll3U8fyd0uLTIs3YXIjyIAUExn5xGjY7TbaSFnAeyJC2Ssxh94I3pVzyQ1pcYQNCPkrNbCq0YRpvsCEhXlvniSx8PbAkL7h3yD1G6vT8xL
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966005)(55016002)(54906003)(70586007)(7696005)(26005)(8676002)(6916009)(86362001)(186003)(34020700004)(82310400003)(9686003)(53546011)(6506007)(356005)(33656002)(316002)(336012)(2906002)(83380400001)(4326008)(8936002)(478600001)(70206006)(5660300002)(81166007)(82740400003)(47076004)(36906005)(52536014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 17:53:11.9709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afcf2b28-b7c3-452e-ab9d-08d869578760
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4058
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQpIaSBFZCBUYW5vdXMsDQoNCldlIGFyZSB1
c2luZyBUd2lubGFrZSBmb3IgSVBNQiBhbmQgcGxhbiB0byByZWFkIGFsbCB0aGUgZmlybXdhcmUg
dmVyc2lvbnMgKCBDUExELCBNRSwgQnJpZGdlIElDLCBWUikgdXNpbmcgT0VNIGNvbW1hbmRzLiBB
bHNvIGRpc3BsYXkgdGhlIGZpcm13YXJlIHZlcnNpb25zIHVzaW5nIGRidXMgb2JqZWN0cy4NCg0K
UmVnYXJkcywNCkpheWFzaHJlZQ0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4NClNlbnQ6IE1vbmRheSwgT2N0b2JlciA1LCAy
MDIwIDc6NTUgUE0NClRvOiBKYXlhc2hyZWUgRCA8amF5YXNocmVlLWRAaGNsLmNvbT4NCkNjOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFZlbHVtYW5pIFQtRVJTLEhDTFRlY2ggPHZlbHVtYW5p
dEBoY2wuY29tPg0KU3ViamVjdDogUmU6IEZpcm13YXJlIHZlcnNpb24gdW5kZXIgSVBNQiBzZW5z
b3JzDQoNCltDQVVUSU9OOiBUaGlzIEVtYWlsIGlzIGZyb20gb3V0c2lkZSB0aGUgT3JnYW5pemF0
aW9uLiBVbmxlc3MgeW91IHRydXN0IHRoZSBzZW5kZXIsIERvbuKAmXQgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyBhcyBpdCBtYXkgYmUgYSBQaGlzaGluZyBlbWFpbCwgd2hpY2ggY2Fu
IHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24gYW5kIGNvbXByb21pc2UgeW91ciBDb21wdXRlci5dDQoN
Ck9uIFN1biwgT2N0IDQsIDIwMjAgYXQgMTE6NDMgUE0gSmF5YXNocmVlIEQgPGpheWFzaHJlZS1k
QGhjbC5jb20+IHdyb3RlOg0KPg0KPiBDbGFzc2lmaWNhdGlvbjogSENMIEludGVybmFsDQo+DQo+
IEhpIFRlYW0sDQo+DQo+DQo+DQo+IEluIG15IHN5c3RlbSwgaG9zdCBpcyBjb25uZWN0ZWQgdG8g
SVBNQiBhbmQgaG9zdCByZWxhdGVkIGluZm9ybWF0aW9uIGlzIHJldHJpZXZlZCB1c2luZyBJUE1C
IGJ1cy4NCj4gSSBwbGFuIHRvIGFkZCBmaXJtd2FyZSB2ZXJzaW9ucyBpbiB0aGUgZGJ1cy1zZW5z
b3JzLiBBZGRpbmcgdGhpcyBhcyBhbm90aGVyIGVudGl0eSBhcyBsaWtlIGlwbWJzZW5zb3IuDQo+
IFRoaXMgd2lsbCBoZWxwIGluIGhhdmluZyBhbGwgdHJhbnNhY3Rpb24gaW4gSVBNQiBzZW5zb3Iu
DQoNClNvdW5kcyByZWFzb25hYmxlLiAgRG8geW91IGludGVuZCBvbiB1c2luZyB0aGUgZ2V0IGRl
dmljZSBpZCBjb21tYW5kIHRvIGRldGVybWluZSB0aGUgdmVyc2lvbiBudW1iZXI/ICBXaGF0IHBp
ZWNlIG9mIGhhcmR3YXJlIGFyZSB5b3UgY29ubmVjdGluZyB0bz8NCjo6RElTQ0xBSU1FUjo6DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KVGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1t
YWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBm
b3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5v
dCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNv
dWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxh
dGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24u
IFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVy
cm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3Jp
Z2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBh
bnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhv
ciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBv
ZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2Vt
aW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24g
YW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdy
aXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9y
IHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZv
cmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhl
bSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo=

Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C582C7C7B
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 02:39:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CknwF54dCzDrMb
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 12:39:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.94;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=WsIYPp9Z; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2094.outbound.protection.outlook.com [40.107.223.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CknvD1pYhzDrJs
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 12:38:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki3E1TubSTz1EB69bf/zRZhjJaKmqxs/JNr4MdhZucU1mDoISoPNSf7VJRUeA3+Lma3cpHjVhiLEKXZ1KaM+A3jsgNp0IouRc1ThAD0S3Bw+3A5UBkiiwrKMPiV46dboY1LVFBnQa7C5FmnpI4vtHwy8r0WXKiO4nfEyIGrJdWUbE828qhveSNBofpYKV2/K//widQwLdpt1XXV4Ndhg4ns3Llkx5WU6IFxrzwyoZQQaagOJxv4tDX8LgU4LHaXBH4GMNuHTIl+TkVPs37AZAPdZypYutQ37PgEvtGtvomIYvzGe96lesnJKDZ8McEmn15Bzli5VgDl485kyvfzhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc4o0kYTXczd7faHGOfC6phkYQC42C2XB7ECTvhyt08=;
 b=ThZ818Hl1hPC878UZWDOFSlIYcchBxBCzt/C3oHKIWNs7o/UIO3EafhQtXWq1a0yd0+UkvpNfjHydxTTMtiJYRa2yor1j/qs3pB6d/DpqL2LWTKnTcdiJFOmE0CPK/Q3PZqD/7RhAa6cR/IoCANgg6WXMJukTQc31c/UQXhjfZI+wigYj4ba7wFe2HaYAMY7cMf1ygEkoeXGHzB7671EA+RfsfJFvAaq97brbIZR+F1HFzA0YFBLKcwu0w0MMlcf7KykyadkOhAehOzSeJS5PietaqIWDmyAs0KT+ldLhkbkWsoYG+saoNq6jwAUOKrGtERrPWJ/3Te6JzF5/Hv4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc4o0kYTXczd7faHGOfC6phkYQC42C2XB7ECTvhyt08=;
 b=WsIYPp9ZkOSAfgI2T88IeDeUETlxX+s5cjKu4csHac5yBvtq90X7hd0twAniOFIrBpBFjEnZZcjjWbd+sq4Qg2gdtK8QBv8l3+p26TMbV3/rOwHZBzgulDy1RDzGuQ9LtxjitDBTJdvg8JwRGIXtECWaIxW6Gg0HvAcyg4//KOk=
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2670.prod.exchangelabs.com (2603:10b6:300:100::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.24; Mon, 30 Nov 2020 01:38:39 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 01:38:38 +0000
From: Quan Nguyen OS <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Thread-Topic: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
Thread-Index: AQHWxGbuw9Pe6HLBJ0mkhgJZyzXcgKnbUWgAgAUOLoA=
Date: Mon, 30 Nov 2020 01:38:38 +0000
Message-ID: <AF69BF44-2C73-4B32-96F6-2E7B68B4E0ED@os.amperecomputing.com>
References: <20201127024158.1486-1-quan@os.amperecomputing.com>
 <20201127024158.1486-2-quan@os.amperecomputing.com>
 <CACPK8Xe9jSu3WctwbT5B7mB54jCKt2gHL27441xd2oJGapP=Uw@mail.gmail.com>
In-Reply-To: <CACPK8Xe9jSu3WctwbT5B7mB54jCKt2gHL27441xd2oJGapP=Uw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [118.69.219.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a635bfb-b4b9-44c8-4663-08d894d0a955
x-ms-traffictypediagnostic: MWHPR01MB2670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR01MB26703ED7DBF8C026FC82CDE6F2F50@MWHPR01MB2670.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ql/7JpTefmeOtqk9+s7jPGBZNP8H85GUGC5pPAA5CLcfGRCsyLaCSrAMoeSnOmlwCAcg1ipflUOtyNlGKBFT/k47zQiw0307aiaq0QnJB6QQlEU8EirZcObeC9gq8P4me2kt7xWKNX+BhtWeg3Nu50o19GPcPaogV08bSl+bVcL1omYnX1juiwSgPILrL3rDuTnTqZ6ORjqWX7f2k3zs6r1RBVaU2c/H9mdHgmtvMxgCW5Tqw4eQYEOoEhzdGmcVGoUJ9aMExPTO+XqydtDzoxgEA4Cosk8ynLjHSn3DqkgUMk7y85PZfHuvCJ4EU4k9Q3PDTb4+52CrS06H+4Br9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39830400003)(366004)(136003)(6506007)(66946007)(26005)(2616005)(6512007)(6486002)(186003)(33656002)(6916009)(4326008)(107886003)(64756008)(478600001)(66556008)(66446008)(86362001)(5660300002)(71200400001)(66476007)(91956017)(54906003)(83380400001)(316002)(2906002)(8936002)(8676002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?L0N1aDlxcStCcUZIbEZoeGZsSXg0WFpEb00zVmpRMHoxL0F3eXV6dWwxd2hH?=
 =?utf-8?B?cXJ1V1lhMy9WT1VQU1ZDeEhQTi9DTmYrRjFNQnlwdDlvclFBZm8zN2NaNjJN?=
 =?utf-8?B?QmhjYkpkbW1DTnByUitoMmJhNlJ6RlYvM2lKNi9xa2JabUhiRGlhMktLVENE?=
 =?utf-8?B?MGpDRmhiUVpDR2lkdjZzand0VUhWbnlTQnBkb3RnazNHZXBRc2dZZUk2c1NJ?=
 =?utf-8?B?OEFIaUg3dm9wTTVMR3lLeW4yZmVZV1FFL2d2cmtjWDFXNUduQWNicCtjNEFD?=
 =?utf-8?B?VlVnMzVVTTlHTHcvZDZ4T2ZrazI3dHRXSm1mTnptVkVEWmgvYVBCOHoyNjlQ?=
 =?utf-8?B?NWt6VnFSSk96WWluamJnKzFQZElCSG9IaXBpaEE4UDRqcS95ZXo3Z2ZEN2x4?=
 =?utf-8?B?blFVZlpmU0JmM1dZVUdWbG5IQWd6QTAweXcvZ285UFVhWW80Vk5vNHpxK1JU?=
 =?utf-8?B?M1FYUVRxQmh2cmhBNVN2ZGpkcGZIOWcvNEhmdE1HMFZwdEtzV01TT0xvSmxw?=
 =?utf-8?B?Rnk4cmRMeVArQmJFZUJQMU5WQ1p4aHF5djJaOXl5MFFNVFNxeGJNeTVCSkdZ?=
 =?utf-8?B?bUMzRGZxc014dDZhbnJSNTkzaCtpTXIvaHVPa01RYmJMZ2RqbVhFc0EzKzVP?=
 =?utf-8?B?bmRqdC9odjdVOWJYNkR2SE16QzdnMG1RRjlBM09Dc3NMNlhNNjhQTU5KZTFk?=
 =?utf-8?B?ckc0RXNCK3FDaGh2Qmx3WVQ3aVkxaGJUdTQzM2lHTXllSG5mODd5WmV4cUhC?=
 =?utf-8?B?ZEFVWTQzUWtHeTQ0RHkvRlpIYXhyWHJhY09MRHF2ZlZNcTBxQzJuMDRDS0tB?=
 =?utf-8?B?TnFSZU9RdUJxaEdRbGFhWGwyeTREZkQ3SWxEVlppckpNSzNUZUZyS1RQRU9l?=
 =?utf-8?B?dWdFRUtqRFIrR2h4aTNvbTNxVDhNUXUzTmFiVHdJTHRpNmVFTEFyY2E1dkpI?=
 =?utf-8?B?ZFJ6TjJwVmdiTFQ1RitWdFVDN0pZclJCTHZKQnI4N1VJSFZIYVU0V09kZkZW?=
 =?utf-8?B?WjRZMkdYVEtTcDhzMEJkMXRqWWtyb2U4VE0xbTdhOTdOQ1ZnSUxrYkVyMWZJ?=
 =?utf-8?B?UHlqa050VXFDNU91VWV0bEJzOGZJdHJVeE1mR1B2R2ZRNWVZTEFZMTJkZ2JK?=
 =?utf-8?B?eEY2NWdRaWZmMWJCc1c3eGxwdGV6VTZOYlZmSlltNFQ3RDM4alZtVjArL1ZG?=
 =?utf-8?B?MEVsV2RLZzJjUzE2UEJKa2tySVpjbG1mWXNiN2tVSS9MOCtNdk9zYUVyamFU?=
 =?utf-8?B?d0dJN2VjMGZmQ3VpelE4UCtxbHRxMVcxRmtUWmNFbHd1bENqVnBLM0VBN24x?=
 =?utf-8?Q?onmscbiHKmXmAda6VldTR2Blkx6bRUhqut?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8B3787730E3A0429CB8A451CB4C5FA5@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a635bfb-b4b9-44c8-4663-08d894d0a955
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 01:38:38.5912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g9yjXgsM1l5cGA5raCrCgp6hbXc9Iii4RWd1VgIrV+X8uOoIwuX69fG+OkkdPHgkPswJ68rdo+UowasB0dsOjRYWoylDSXrSVugx81+wn7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2670
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEpvZWwsDQpXaWxsIGZpeCB0aGlzIGluIHYyLg0KLVF1YW4NCg0K77u/T24gMTEvMjcv
MjAsIDEwOjI2LCAiSm9lbCBTdGFubGV5IiA8am9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQogICAg
T24gRnJpLCAyNyBOb3YgMjAyMCBhdCAwMjo0MiwgUXVhbiBOZ3V5ZW4gPHF1YW5Ab3MuYW1wZXJl
Y29tcHV0aW5nLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gQWRkICJhbXBlcmUiIGVudHJ5IGZv
ciBBbXBlcmUgQ29tcHV0aW5nIExMQzogYW1wZXJlY29tcHV0aW5nLmNvbQ0KICAgID4NCiAgICA+
IFNpZ25lZC1vZmYtYnk6IFF1YW4gTmd1eWVuIDxxdWFuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+
DQogICAgPiBTaWduZWQtb2ZmLWJ5OiBQaG9uZyBWbyA8cGhvbmdAb3MuYW1wZXJlY29tcHV0aW5n
LmNvbT4NCiAgICA+IFNpZ25lZC1vZmYtYnk6IFRoYW5nIFEuIE5ndXllbiA8dGhhbmdAb3MuYW1w
ZXJlY29tcHV0aW5nLmNvbT4NCiAgICA+IC0tLQ0KICAgID4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysNCiAgICA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQogICAgPg0KICAgID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbA0KICAgID4g
aW5kZXggNjA0MTY2ZWNhZWZiLi4xODg3Y2Q1Njg3ZGEgMTAwNjQ0DQogICAgPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwNCiAgICA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbA0KICAgID4gQEAgLTk5LDYgKzk5LDggQEAgcGF0dGVyblByb3BlcnRpZXM6DQogICAgPiAg
ICAgIGRlc2NyaXB0aW9uOiBBbnZvLVN5c3RlbXMgRHJlc2RlbiBHbWJIDQogICAgPiAgICAiXmFw
bSwuKiI6DQogICAgPiAgICAgIGRlc2NyaXB0aW9uOiBBcHBsaWVkIE1pY3JvIENpcmN1aXRzIENv
cnBvcmF0aW9uIChBUE0pDQogICAgPiArICAiXmFtcGVyZSwuKiI6DQogICAgPiArICAgIGRlc2Ny
aXB0aW9uOiBBbXBlcmUgQ29tcHV0aW5nIExMQw0KDQogICAgSSB0aGluayB0aGlzIGZpbGUgaXMg
c29ydGVkIGFscGhhYmV0aWNhbGx5LiBZb3Ugc2hvdWxkIGZvbGxvdyB0aGF0IG9yZGVyaW5nLg0K
DQogICAgPiAgICAiXmFwdGluYSwuKiI6DQogICAgPiAgICAgIGRlc2NyaXB0aW9uOiBBcHRpbmEg
SW1hZ2luZw0KICAgID4gICAgIl5hcmFzYW4sLioiOg0KICAgID4gLS0NCiAgICA+IDIuMjguMA0K
ICAgID4NCg0K

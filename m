Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B257394B9
	for <lists+openbmc@lfdr.de>; Thu, 22 Jun 2023 03:40:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=Pk7pt/vw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmjjd4kTPz2xLS
	for <lists+openbmc@lfdr.de>; Thu, 22 Jun 2023 11:40:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=Pk7pt/vw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=ami.com (client-ip=2a01:111:f400:7e88::600; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=kennywu@ami.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmCx21h4Gz2xLS
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2023 16:18:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8bGsGxKfnQgWrMprpsfhxMKQVw2sTBb+rQ/fRC/+2SVz3jH2BUK/WbQNi17rGVmdxNMYu9kXcQyBtymb6W8uWiM1s0V0Z5HLERISA3EyN023Oj3wKRRl1yqIFY5kC6BmXjF09HWItkfbohAij5IElA0WUYjyrAJ61T2SjyKNIHgSdr5kbMwG14jYPlwNzOBf5gueRNgIe+qyNQXEyC/KvxDtWKA3OVh5YaLVAVyZ0z4+zkH6dksIhjao8qQyp+4YyHjKw7pU0GekS02xsCfZZsarnVMJSK27P827OjDjfPiUnZzfXpyaw68h1k3jue4jy0A4LdeIQsbQ+MAI1+M3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwREKtt41kWvqz5uZCifsgDCOPcB2P6NRtIVvGFDQLY=;
 b=XH3cAWujKGu3htSHrlZyf4cV5kxfZvXjGkNXUGmH+obS0ncDkiOViRqOoAMmjrGOKny/fG6hxKKR6f8AclbAgBfY7joqD0TeOm0eDu2t0JHlJVKdEoK+r6Pm6z3nZwiM6nMBKD6QemFsupLc9PNv5G2Zr6oqx54NKPgS2pVqrkIVvKeBCwm4y6U8D8YApRq2j146kwHTs1F1kzbuE8GiMCG8MpVje/ntWG1SDQmjQRvihkA0rDs5Gv6LGNoTqtaqH+0sLf3aZuTXmGvfSBBttaW+h6hjc0O57GqPRcT9/dQmFpq/SeE1xPUlBPvLNJ6t7zN+6w+IWTT8j7CqPmAjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwREKtt41kWvqz5uZCifsgDCOPcB2P6NRtIVvGFDQLY=;
 b=Pk7pt/vwD0PFmV6+YDg0rgDmQKzUFZDgMr/bv/VSPDNr5Ir+VKJd36dCj23AT2amVtpmnLVQt9evgDymHLi1tNLLHI1vqyh+6JXYuUsS+6Zq159PW/W7vE7a29OEJ6XE193hFwDbASxDGrOVb1W8qYhdXx7r8JXW54C93mlbExI=
Received: from DS7PR10MB4861.namprd10.prod.outlook.com (2603:10b6:5:3a7::15)
 by CY8PR10MB6729.namprd10.prod.outlook.com (2603:10b6:930:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 06:17:47 +0000
Received: from DS7PR10MB4861.namprd10.prod.outlook.com
 ([fe80::c0b:f972:c3f5:ac2d]) by DS7PR10MB4861.namprd10.prod.outlook.com
 ([fe80::c0b:f972:c3f5:ac2d%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 06:17:47 +0000
From: =?utf-8?B?S2VubnkgV3UgKOWQs+W7uuWvrCk=?= <KennyWu@ami.com>
To: Ratan Gupta <ratankgupta31@gmail.com>
Subject: RE: [EXTERNAL] Re: The design of multiple VLAN at OpenBMC
Thread-Topic: [EXTERNAL] Re: The design of multiple VLAN at OpenBMC
Thread-Index: AdmjH4QqnhWQphzKQ5mCi4kq39XmDwAHoiAAACwtxqA=
Date: Wed, 21 Jun 2023 06:17:47 +0000
Message-ID:  <DS7PR10MB4861A9A481E8CF2955356128A55DA@DS7PR10MB4861.namprd10.prod.outlook.com>
References:  <DS7PR10MB486175B1DBCE7437A2F8E980A55CA@DS7PR10MB4861.namprd10.prod.outlook.com>
 <CAMhqiMqGwvNFP7knyTQz7bLk1jHffhkqCb74oy7cZswQQz57wg@mail.gmail.com>
In-Reply-To:  <CAMhqiMqGwvNFP7knyTQz7bLk1jHffhkqCb74oy7cZswQQz57wg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-Mentions: ratankgupta31@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB4861:EE_|CY8PR10MB6729:EE_
x-ms-office365-filtering-correlation-id: 125ea497-9758-4986-60b3-08db721f3bc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x0CZsyL7YDydpv41rWgTEdX/CkXMYwxNAksAZvBehpiP/SJ6h1Aq9K9bNK/EtnkauMO6ZR9kWt/PLnNgE6Gs9ebA9rvCeXO+IKyXGofqW9p+gomgqYevZxQpcPtyIY0eTQn9eO7KcULo1Urr3e2W0GCH2UjUdVLoIDNMx5OwSgIz6FGVuiW4xeztF+9zq4zTk3+tlIRkPhnEA/7BwpOaZpavDdA+VIm0+TYhHU+Us0dZK3kPTskvv+59DOqv/0Rla6NAWXVYmWAzwQ/50Djso1c9UXd7y/Svsgyslm70D7GlLUptJ6DYa33annQGJnXU1zQS+9HDQNlyAfoOq9JYMLbTvwd9R6FSXmk8RQHFc4AP97bn1jmCCh5AUrUKeLYwyCgh3xYhytlg7GxXRrJQLycOLU4vDl4cVsQhiDzHvQHQUV7I1UoSF+Q03JSm3Seehj3o41APu0ntKo5RQHzrnRASMb8z/X8d1pStvr6DS6TQXB/PLRYhJjza3F8CL+QJrhCvb6vNPscdYnJWPc73UMdyF8dKeixO0ILDy8oYjXEd4LuLNi3wKkW0pA0hctCAwi1hvII8wl9tEXt+HSteEnT2r8yquMocBXT5OyPn3CSlxaTGeJn5k2JYZUzgbX9t
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4861.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199021)(8936002)(2906002)(8676002)(5660300002)(52536014)(54906003)(55016003)(85182001)(316002)(41300700001)(6916009)(4326008)(66476007)(66556008)(71200400001)(76116006)(66946007)(64756008)(66446008)(40140700001)(33656002)(7696005)(478600001)(38100700002)(38070700005)(86362001)(186003)(122000001)(83380400001)(53546011)(6506007)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U1BmRHorSUlEYkFMb3BwclcxNWVaSGp2bUxQTkFxVXUyU0RJTDljMHdZSnk4?=
 =?utf-8?B?aitkb1Q4QkJMcTRvVmRqTUJuV0tTQkhzbVQ2UjBxTVJDd3ViTlBJV0IwQ1dv?=
 =?utf-8?B?VzhqODVRZWNlTVo5UHdLalBDd1JXNzlFWnJnMlFYd3Y3Zy9VdlJFV1djM1M1?=
 =?utf-8?B?cGlXTGpBaVlJTTdvNitkYmlEMlRCOW1SN1FMemtzVFVGSjJ1QVk0UXhTMUp2?=
 =?utf-8?B?NXZyT1VPQ3NTdVlRZjdsR2xMVHAxUEcwSTE4SFp6Ymlha2todjM3dElEV1dQ?=
 =?utf-8?B?REtJK3BZVVRTODcyczZIZ0xjUnNKQ29EeE5JQ3RUeVR3NWtnVkU0UVFWUTIv?=
 =?utf-8?B?bThSbXYxeFVYM1pLNjdLUTRuL3pmN2huVjhiemxQb2hvZG5kdnVQYVd2QjM5?=
 =?utf-8?B?UEF6OGJMRjRFRGRBQ0hCU3RKYW81cmRMK0lvV0dSeEJXMGFEdExWUUx0VTNY?=
 =?utf-8?B?U1RCQXlLUjdQd2syK1Nja2g5SWJiaXhmVGh6WlBBSDJWVTJHdEl5WjVzVURq?=
 =?utf-8?B?UXorbm5ST2VkVG9abW45dStTWXJNU2xVWEhraWpFMmM4NnhmSUlCNUxnQnMz?=
 =?utf-8?B?YmtZVW01YzZhSVVobDdNOTJnRTRMVG5TSXhNTTAwdHZpeUxpM2lSZXdTdlVC?=
 =?utf-8?B?eHVvQnFGbCtydDl5OFZHK0QxaFA2K3I3eEU5aFloUlRMNXhjalE0OUd5eFMw?=
 =?utf-8?B?SUJtdUZTTENhcTBFTHNxMDFPSDVneWRWV3lIUjdmbVkxT0hIeDRtTldLNDZh?=
 =?utf-8?B?R2tacEVoSVdpR0hQUW1BNUNMUlkyNEVaQ0RrTXVpZ0RYZkN2S3FQTHkzclQy?=
 =?utf-8?B?dXBnYnlyT3FtMmxpa3YyaCt0d0dsOFhjNGdCOWdSU2Q3ak9IUXlDZVk3TkR1?=
 =?utf-8?B?Mjlac0cwV1h4MjJVb09NYVVTaDBhcEUzSUhUL08zYWFTSzVaYkNCbERiT3g5?=
 =?utf-8?B?QmZHTDJ6RUxWSVh2akZwNEtpYWVHVklUOFBNeWRmaWN1WUwvRFNIOEEyR2xh?=
 =?utf-8?B?bHVua2lrSjI4d0RZQTBoWG5HckVPMnRzQXBGRk4xcDVaKy9XdFpDcVNCaVBR?=
 =?utf-8?B?cWQycENreE9oSFFrbTZac2JYMWVDNGxHUmpHeERUTHA1TjZVdTRYbVArbDVD?=
 =?utf-8?B?RDV2NjNoQm1TbER6eWdGN0kxMEc3RFF0eit0cEcvc01ZdFE5VUZvMFFCVHNV?=
 =?utf-8?B?Yi9XOTBzajRmTXc4N3BSVEhCUnA0b2ljdDExOGgxU0lMT2Q5bXY4QXNGYk56?=
 =?utf-8?B?VFFySTduRzF5eTcwMGZza1ZSZkdWMHJSV1lnNHR2Q1hOc3dWWUJWVWNJNElF?=
 =?utf-8?B?aVZqREpIYSsrOUdyWEozR1dEdm82eGpLYmtNcmRiOU9abFFJbjZvTzY5a29W?=
 =?utf-8?B?bUs4cGdHZUQrSSthTis0Z2dBNmhZL3BuNEFqY1ZVNHJMV0xUN0NqRFVvZno2?=
 =?utf-8?B?c2JOU3BOL1RrSHY3NGtQVzc2dWo0UEQrVnFPSytkUDlweUY3VjdkckZzY2R1?=
 =?utf-8?B?UERJSGozaEhud1dPaC9YYmNKejAzaGhPaFRUamdBL1FYcXN0ektOZ0Y2ZS9v?=
 =?utf-8?B?QVUvOVF2UHpaK1VVK2ZGMURYVUdwRy9aS3huYjJMYmU2cExpUFRIZ056TzY1?=
 =?utf-8?B?aWE2OCtVZHgvL2dITWlkRWpsa2lwT25hVVZJLzhwWW5lSnZGa092bmM3S3gy?=
 =?utf-8?B?V3diR2ljOFdZWVl4QWF3QS9nYmZmeHBIMjZBc212dmJTeWhQVTYwY1VBTUly?=
 =?utf-8?B?MkRQRHJYV2VMNmlleHFkS3dLR09KQktHSlN6SG56ZExER1VXOU1iYjVOVGhw?=
 =?utf-8?B?ZFEvR3hqVzJPL2tqMjJOV2luSHhkWllNdERqWng2SWE2Y2JibENiWjZmdEdr?=
 =?utf-8?B?MituQXBrd29OYVMvNDgvZ0dPMldQUWxtV1podTBJN2VwRkhkWkpyWEV0Vy85?=
 =?utf-8?B?dzV6VDQ2cnI3UmppU3hNcGdLTTdKZGVsVjNCQkNnOW0wNUpJRCtiaHF3M3Uv?=
 =?utf-8?B?elBnRDZ4c2pob2ZBc1I0TzZHOEwzWXVkZEdtZ25ha1EyWmh6V3pyeTdOaXdr?=
 =?utf-8?B?MWpvMVBTd0lFK0VrZXdDSHNNekVDOExqWFMxV05XYm9YR2ErV3RlVEM0VlhB?=
 =?utf-8?Q?2nE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4861.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125ea497-9758-4986-60b3-08db721f3bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 06:17:47.4768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iR/zxP7EnbgACWB1pEl2mFzTt8HPA6j9hQFNLHf4K5O1OG392eZ3Zc4lcx+lIRPl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6729
X-Mailman-Approved-At: Thu, 22 Jun 2023 11:39:32 +1000
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
Cc: Pravinash Jeyapaul <pravinashj@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQFJhdGFuIEd1cHRhLA0KDQpUaGFua3MgeW91IHJlcGx5LiBJdCBpcyBoZWxwZnVsIHRvIHVz
Lg0KDQpCdXQgSSB3YW50IGNsZWFyIG1vcmUgZGV0YWlsIGFib3V0IHRoZSBudW1iZXIgb2YgVkxB
Ti4gRHVlIFJEIG1heSBuZWVkIHByb3ZpZGUgZXhwZWN0IHJlc3VsdCB0byBRQS4gUkQgY2FuIGxp
bWl0IHRoZSBudW1iZXIgb2YgVkxBTiBieSB0aGVpciBvd24gZGVzaWduID8NCkFuZCBmcm9tIHlv
dXIgY29tbWVudCwgYSBzaW5nbGUgVkxBTiBpcyBlbm91Z2ggdG8gdXNpbmcgYXQgZ2VuZXJhbCBl
bnZpcm9ubWVudC4NCg0KVGhhbmtzLA0KS2VubnlXdS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFJhdGFuIEd1cHRhIDxyYXRhbmtndXB0YTMxQGdtYWlsLmNvbT4NClNlbnQ6
IFR1ZXNkYXksIEp1bmUgMjAsIDIwMjMgMjoxMSBQTQ0KVG86IEtlbm55IFd1ICjlkLPlu7rlr6wp
IDxLZW5ueVd1QGFtaS5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBQcmF2aW5h
c2ggSmV5YXBhdWwgPHByYXZpbmFzaGpAYW1pLmNvbT4NClN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6
IFRoZSBkZXNpZ24gb2YgbXVsdGlwbGUgVkxBTiBhdCBPcGVuQk1DDQoNCg0KKipDQVVUSU9OOiBU
aGUgZS1tYWlsIGJlbG93IGlzIGZyb20gYW4gZXh0ZXJuYWwgc291cmNlLiBQbGVhc2UgZXhlcmNp
c2UgY2F1dGlvbiBiZWZvcmUgb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9y
IGZvbGxvd2luZyBndWlkYW5jZS4qKg0KDQpIaSBLZW5ueSwNCg0KWW91IGNhbiBoYXZlIG11bHRp
cGxlIFZMQU4gb24gdGhlIHNhbWUgaW50ZXJmYWNlLCBJIGRvbid0IHNlZSB3ZSBoYXZlIGEgcmVz
dHJpY3Rpb24gb24gdGhlIG51bWJlciBvZiBWTEFOcy4NCkl0IGlzIHVwIHRvIHRoZSBzeXN0ZW0g
YWRtaW4sIEhvdyBtYW55IFZMQU5zIGRvIHRoZXkgbmVlZD8gSW4gYSB0eXBpY2FsIHNjZW5hcmlv
LCBpdCBzaG91bGQgbm90IGJlIG1vcmUgdGhhbiBhIHNpbmdsZSBWTEFOLg0KDQpUaGFua3MsDQpS
YXRhbg0KDQpPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCA5OjM54oCvQU0gS2VubnkgV3UgKOWQs+W7
uuWvrCkgPEtlbm55V3VAYW1pLmNvbT4gd3JvdGU6DQo+DQo+IEhpICwNCj4NCj4NCj4NCj4gV2Ug
YXJlIGRldmVsb3AgT3BlbkJNQyBhbmQgbWVldCBzb21lIGRlc2lnbiBxdWVzdGlvbiBuZWVkIHRv
IGNvbnN1bHQuIEkgd2lsbCBiZSBhcHByZWNpYXRlIHlvdXIgcmVzcG9uc2VzLg0KPg0KPg0KPg0K
PiBUaGUgVkxBTiBiZWhhdmlvciBhdCBPcGVuQk1DLiBJdCBzdXBwb3J0IG11bHRpcGxlIFZMQU4u
IElzIHRoZXJlIGFyZSBhbnkgcmVzdHJpY3RlZCBtYXhpbXVtIG51bWJlciBhdCBlYWNoIHNlcnZp
Y2UgSVBNSS9XRUIvUmVkZmlzaC4gT3IgaXQgaXMgZGVjaWRlZCBieSBkZXZlbG9wZXI/DQo+DQo+
DQo+DQo+IEFzIEkga25vdyBJUE1JIGlzIG9ubHkgc2VydmljZSBvbmUgaW50ZXJmYWNlLCBWTEFO
IG9yIG5vbi1WTEFOLiBPbmNlIHVzZXIgZW5hYmxlZCBWTEFOLCB0aGUgSVBNSSBkYWVtb24gd2ls
bCByZXNwb25kIGJvdGggPw0KPg0KPg0KPg0KPiBUaGFua3MsDQo+IEtlbm55V3UNCj4NCj4NCj4N
Cj4gLVRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIG1heSBiZSBjb25m
aWRlbnRpYWwgYW5kIHByb3ByaWV0YXJ5IHRvIEFtZXJpY2FuIE1lZ2F0cmVuZHMgKEFNSSkuIFRo
aXMgY29tbXVuaWNhdGlvbiBpcyBpbnRlbmRlZCB0byBiZSByZWFkIG9ubHkgYnkgdGhlIGluZGl2
aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQgaXMgYWRkcmVzc2VkIG9yIGJ5IHRoZWlyIGRlc2ln
bmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJl
Y2lwaWVudCwgeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMg
bWVzc2FnZSwgaW4gYW55IGZvcm0sIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBwcm9t
cHRseSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgb3IgYnkgdGVsZXBob25lIGF0
IDc3MC0yNDYtODYwMCwgYW5kIHRoZW4gZGVsZXRlIG9yIGRlc3Ryb3kgYWxsIGNvcGllcyBvZiB0
aGUgdHJhbnNtaXNzaW9uLg0KLVRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNz
YWdlIG1heSBiZSBjb25maWRlbnRpYWwgYW5kIHByb3ByaWV0YXJ5IHRvIEFtZXJpY2FuIE1lZ2F0
cmVuZHMgKEFNSSkuIFRoaXMgY29tbXVuaWNhdGlvbiBpcyBpbnRlbmRlZCB0byBiZSByZWFkIG9u
bHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQgaXMgYWRkcmVzc2VkIG9y
IGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3Qg
dGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJp
YnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIFBsZWFzZSBwcm9tcHRseSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgb3Ig
YnkgdGVsZXBob25lIGF0IDc3MC0yNDYtODYwMCwgYW5kIHRoZW4gZGVsZXRlIG9yIGRlc3Ryb3kg
YWxsIGNvcGllcyBvZiB0aGUgdHJhbnNtaXNzaW9uLg0K

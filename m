Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9638C0DD
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 09:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmdrw1TGDz308F
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 17:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=BSo0rhpm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=6775408355=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=BSo0rhpm; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmdrZ4sxMz2xZH
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 17:43:25 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L7hBVZ032315; Fri, 21 May 2021 07:43:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0b-00268f01.pphosted.com with ESMTP id 38nq5ju73x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl77WdDczDSn581C4Q8/UYaKEnW6wqFUz0zb5bKfyEAyhZ3FHrtw/MPP09U/KHkwWBtKTVqZJY+mxFJwl6as/zoFYc9fmMZydBew14Ju/3thTYG36L/cSXGiaWblRSmhOtcN+7iP5hXyrGdss0QBWpCXj2s3Nv93tM8qdByx+mtBGGr9RRLOACbILhzdikBf91AI/2RIBL7BSsj+Yt9aq0uuZYn/UFnZN4SInpCaRF59TAALK7EfjK+PF5ALVrpsVq0THRgG5DUjF1Y/M2Q2GKiZ9OcZDgJy5NUonA7LQla4/64pJu/Bg5hfWnE6GSLejnMptISw10hxEkBhoCudug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FksyB38T5jMe2BAYOKyecC9cchWfhZ4xLUKFhJ15O/w=;
 b=h8ciabdLejzm1j1tAI9RB5OEZGIGM5eiSYx7eXrP84f5XlMIjvPPgZFOMBt1JkUbjdT5CbNGYcDA7xGK9L3Adi+/J+ezLIm1cVDLIrjStUNWRtmcR+nK/xJZjhY9YY7u0LJljYMDrC8iKyWdebVYrJWELP+k9QLFaHw80w6O/QWfkllCd/+95vuVo/58i7bHzYTxin1xeGRbp6LprlHNldlh8xQhoGhn1J4A74NRmY0eVZlZwYxxKiMzqv28fbMVzZKMwaC8o9uUTk3roo1bSmw2YwhSpdTK1TLXYh5rWWDzajbjBk9nlVSC89WG6MtVRqHHIQJy1BhjosYOQ93/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FksyB38T5jMe2BAYOKyecC9cchWfhZ4xLUKFhJ15O/w=;
 b=BSo0rhpm1Uc8SzRLc/GKPwBQi5vutxEaeqeJgWPz09J6eDWGBVthUZDhtuTDBXtIcmCdJJGh2s2e1GWQkhokCkOPJfZwxY6j9OriMl8+zdtE74k2H4rvyqaKB1T79X0VdjEw4P/gQttCSEv2KZY9z3n4MZKKLubO3kfErUVJ3J4=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0298.namprd04.prod.outlook.com (2603:10b6:3:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Fri, 21 May 2021 07:43:18 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:43:12 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.10 v3 10/18] ipmi: kcs_bmc: Don't enforce
 single-open policy in the kernel
Thread-Topic: [PATCH linux dev-5.10 v3 10/18] ipmi: kcs_bmc: Don't enforce
 single-open policy in the kernel
Thread-Index: AQHXThTzd7W4u6ZaXE+qTqr2nj9F4w==
Date: Fri, 21 May 2021 07:43:12 +0000
Message-ID: <YKdkjwo+LPMsBdx8@packtop>
References: <20210510064955.1704652-1-andrew@aj.id.au>
 <20210510064955.1704652-11-andrew@aj.id.au>
 <CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com>
 <61f9d748-b4e1-4b64-aaf5-1930cda0206d@www.fastmail.com>
In-Reply-To: <61f9d748-b4e1-4b64-aaf5-1930cda0206d@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c00cdf77-6a72-4325-5f38-08d91c2c1600
x-ms-traffictypediagnostic: DM5PR04MB0298:
x-microsoft-antispam-prvs: <DM5PR04MB0298F5AAA3D4760A74C25813C3299@DM5PR04MB0298.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sYzCNc8iG0NhxbEKwREKePchL9bUQ4l88sX6vWwyaVwyqtqBm+trxvM9bTyHk6T31pCCayrB37Kn+UCeiqvGYZTvb/q7PLj7G5WcB4aar0UAwo1t3lNnF/jdEjlXy3YpkhCczErYpsih+NfAOBq6gBVBKQNiZBP+mf812pwUqfEovnxvB1kC5QTFXBDvUI0p/na/I8r0FXlAGMO215EnYrg4atYC6qZCSvtXPqo83r7iLr2WTlcSudj1l4TtCNXljH7+Cgqm5oNwKW/30fYq/c7YeAuLtn/8yDZDnXlC68yoxDCuCb4iuQVxUfSaHghQNwyD0gVUzlG5nrdcJ8yzVEvixXumkVT6vjJI/wFcEitqZjCvzSVtiF/c7guU4fgcENEpSE+qDOTR/x4jJPS/OORKJpeh+5zy8BgcQf+xkGCZI28p0T+42bWal5Ew5j0OhtVdYlg/lnaPGmScy1HMJAGeLeeXDME3zuKkpJgo+EB4a6lPiO8fArBiiGahawvTPfx2Q2hUgGT2K1dqNa17DCkRpAGEvwlwEqrCmA9rpRhCgpipzlc0rc8jIgD+tT5JAdLhAj3HtYTA2qf3J35Txk3gwwF0IRag0zPgtFVfN+RE7hsjuF+2DS7/qnt2whCj7K/8J0z/OcJ+sRzlnAy+bIFZRP0vSmDZmwjZ/L4DUyU2hCh0GLMe9MGVULL8LKVcvQVQ6+pP0vSDg24gpNwePGhwWGY0iLeMXEB4v1X66JaDZK8hCbQAnKT+C7ZWTk4TbDjnKXqgPtFrZGUHEofM9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(136003)(376002)(346002)(366004)(396003)(71200400001)(8676002)(83380400001)(8936002)(4326008)(66574015)(316002)(5660300002)(26005)(6506007)(33716001)(86362001)(186003)(6486002)(76116006)(6916009)(9686003)(66556008)(38100700002)(2906002)(122000001)(66476007)(66946007)(6512007)(64756008)(66446008)(478600001)(53546011)(54906003)(67856001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+GttP+SmR+xDLJ1t7kQw/sDgamhePyf3I5oEsF18BRPtr1FxYkIZM9PvYA?=
 =?iso-8859-1?Q?z2TLmJcS6bnHSzukeicJSNWXbQ+CCRLUz4XmYVCf6FwojB3E+/JzL3pLj1?=
 =?iso-8859-1?Q?ErpU17xCWUyx/07UYKcEXqS03kVFkwh+FMz/EL/7Snkz1EwV5mUzMRlzDp?=
 =?iso-8859-1?Q?IpmXixmC2wVTQ6PJSc6Phm6NjKhF24gjdS4WyuTncYwmBuOOphWMzj5ZWp?=
 =?iso-8859-1?Q?sc5uDtrRNRT9EvGRxTTCkO2IuQEUSbWZHAJbqTt6djWi4VxcbCFtkr6AkG?=
 =?iso-8859-1?Q?NKnpwPItdugp0F4Idio+gwjOl07aiV1pzkhzPN134OMabesCVsXeMfzBC8?=
 =?iso-8859-1?Q?WfmZmKzb75aX8csNWiV5MBoEHDg3CDBnYhdfybP+tKrpoYMt8NipIl37Qz?=
 =?iso-8859-1?Q?exuILV3M6F3cQlDKfyY3SajQ5V1gth9UBSbUGxi1DlzsZst+7zCO1Vjc5D?=
 =?iso-8859-1?Q?MyzRqHHui+fJPmRNPkCieNHFW25TId7MQDGO24hY6AX0VxpuejOt/SorB1?=
 =?iso-8859-1?Q?O0UPe9fCIFt9JrzTEOkW+ynKxkVpIzB6huiTClG8fPWu7C+vZvHHDtWa4n?=
 =?iso-8859-1?Q?kJ/kWdJ1BuTWNQK/PHq4ccYqC6wL66PTzxkQpDFDOXlqz2CxedmrsUFLEE?=
 =?iso-8859-1?Q?Trkx4vKcF63DCydGGG4e6qo8inLfqrpL8jDkeyKQIheL0JydDG+Rob6trk?=
 =?iso-8859-1?Q?eQOndoO0p/zeRQY3AGnjYr0OJc2HmP06W89Uy9XjufQyitpJEJ4K4hmM1B?=
 =?iso-8859-1?Q?kbBzBRBBFysQYqLAsThK3hb9B6/fAKBDRlJaWj3Q1+zspowa8ZZlWM7W8I?=
 =?iso-8859-1?Q?Z1VlJwX3xroFz6cL9NawCz1Rrx5xuKE2Lam9mAPRozTsQlG8sdQfHenIYZ?=
 =?iso-8859-1?Q?frNqKSEdK6QDd3aiReSlDbNInCsfYbAgYpYE+43gLUtKQDENTaKd4OcEn+?=
 =?iso-8859-1?Q?fODjUEuvfMht0HDfUqpnURs1jDYR/DwehNnnJ+9CJXpt25bR63CK6hPMK4?=
 =?iso-8859-1?Q?pxnk/76Yr1kjVPaGlXb7v0DfB2zXFK6Qxit+y2sescBZwvxoTM1aFtrIAb?=
 =?iso-8859-1?Q?39V9Sdz8eRrlPg1asHCOeMHZT93dIdpySOpuA7iV8ExD+kG04NSjeHfVwQ?=
 =?iso-8859-1?Q?quFkI0YtYXtWIoJBb93ClRrmZcTWbi3Kj55NefKNr/c4B2YGGZZhJ4QH1q?=
 =?iso-8859-1?Q?aPcxztPOu5ugkBffPXbu30BMCQi3f/HnrovWh2r/78PfEgBN2EiW3/Bbe4?=
 =?iso-8859-1?Q?e4e2j48uRBekIB0TFiplFOuH2uiIpCKIw1QdBY26V4rCn4RE7xF5UjoXwv?=
 =?iso-8859-1?Q?+KQ3p17anl97WYV+bfR2kvOe7hRuEbhqRICAqXtXe7ZHQX/GJE0SYZqSP9?=
 =?iso-8859-1?Q?t7EQPn8Hbkih5+T6gI+v8viexmZYWHhQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6638B25030AD1249A9538EDE5DE71D3D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00cdf77-6a72-4325-5f38-08d91c2c1600
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:43:12.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTw4evLfQDcfQEaBAgUkpEouswKAkvK2vbsPTq+ziVoyj10G2F0H993vXH6t2pxzAS01k6HrSQFZXOY6oNWCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0298
X-Proofpoint-ORIG-GUID: y2maAw7vCRo_41S2ZgKEMAtDobc5q5Lv
X-Proofpoint-GUID: y2maAw7vCRo_41S2ZgKEMAtDobc5q5Lv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210050
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 06:59:24PM CDT, Andrew Jeffery wrote:
>On Mon, 10 May 2021, at 18:26, William Kennington wrote:
>> Why would we want to change this? I personally think the original
>> mutual exclusion policy makes even more sense with multiple client
>> types, so that the upstack programs actually know when they are being
>> locked out. Having clients that are able to open the fd but remain
>> broken if they don't do higher level synchronization just feels like a
>> good way to have hard to understand behavior.
>
>So there's this from Arnd:
>
>https://lore.kernel.org/lkml/CAK8P3a2e3zNqMJSN-LAAjYmy8Gr=3Dwjn5MMDMinxawO=
WcMgo7Ww@mail.gmail.com/
>
>> On Wed, Mar 3, 2021 at 2:54 PM Alex Benn=E9e <alex.bennee@linaro.org> wr=
ote:
>> >
>> > +       /* the rpmb is single open! */
>> > +       if (test_and_set_bit(RPMB_DEV_OPEN, &rdev->status))
>> > +               return -EBUSY;
>>
>> open counters on device nodes are fundamentally broken, because
>> they do not stop you from using dup() or sharing the file descriptor
>> across a fork. Just remove this.
>
>Assuming Arnd's point didn't stand on its own, trying to prevent
>multiple opens requires two classes of checks in the kernel, where:
>
>1. Multiple file descriptors can be associated with each device node
>2. Multiple device nodes can be associated with each device.
>
>Ensuring we don't have multiple-opens via multiple device nodes (2
>above) can be done generally in kcs_bmc.c by associating the device
>node (client) context with the device driver instance and erroring out
>if an association already exists. But addressing 1. requires each
>client (chardev) implementation to enforce the 1-fd-per-node
>requirement as well, which isn't great.
>
>If you squint, the IPMI KCS devices look like a simple UART and so we
>can look to the TTY layer for inspiration. TTYs suffer the same issue
>of hard to understand behaviour in the face of multiple opens, and
>define a single mechanism for avoiding both 1 and 2 above by way of
>userspace lock files:
>
>https://tldp.org/HOWTO/Serial-HOWTO-13.html
>
>The lock should be defined in terms of the underlying device as we can
>have multiple behaviours exposed through multiple chardevs for each
>device. The device can be derived by e.g:
>
>```
># echo $(basename $(realpath /sys$(udevadm info --query=3Dpath /dev/raw-kc=
s4)/device))
>1e789114.kcs
>```
>
>Given that the kernel currently attempts to prevent multiple open we
>can assume this is something userspace isn't doing, thus it's safe to
>lift the restriction.
>
>If we do have userspace competing for access then it needs to implement
>the locking scheme outlined above, which can be done regardless of
>whether the kernel supports multiple-open or not.
>
>Andrew

I guess I'm kind of on the fence on this one, though maybe leaning
slightly in William's direction.  Certainly as Arnd's point illustrates
it's never going to be a totally foolproof safeguard against userspace
that's sufficiently determined to get itself into trouble (e.g. dup(),
fork()), and yes, it does seem fairly analogous to the situation with
ttys...but at the same time, it's not like it compromises the integrity
of the kernel if it does end up happening anyway, and if as your commit
message says multiple-access leads to undefined behavior, it seems like
we might as well make that trap slightly harder to fall into instead of
easier?



Zev

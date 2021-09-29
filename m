Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69941CEA0
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 00:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKVhS2ptfz2yHD
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 08:01:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=hJVh2Ug8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=1906b631cd=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=hJVh2Ug8; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKVgw1y5wz2xXV
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 08:01:12 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TIrWRW015642; 
 Wed, 29 Sep 2021 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=nAd3hC6+9tYVMt8Hq06dVqDUgM3EOvSCsg7PgsPCOtw=;
 b=hJVh2Ug8L75PAl2bDPF6TVfF2QMbsIxYqhPiB+cKb+nHlGTtK95HapdboS5OX8odMawL
 EfPjsiwVrXogCWLSSR+tL4EyorHZ4sQGWKr5TOgH0oLSvCeC9jl7HdP5vfSMbEqTfIh7
 qi5RBFzU0Hm5fUvDeFDA9Y/wk0VKaHUppM+XflcleRjIevJr/fTLG7Y2YqdjMoC7tfRI
 5HWjjB4AH8JtkRcNrCYbN4EkST8rWwypQDIgF1yQJAOnIR+OS63+JfGWascEpFRTOdl6
 FgPsIDYxzJNpK47Jl3jqQP0kJXdVtf65p5KLHzJ+wPNBrRlaZJCmiZQGF7mqxqnoPYQR Rg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-00268f01.pphosted.com with ESMTP id 3bcwtg8gds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 22:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkfzAwXsAMcYz3l0vvm/Ovu1aLxPfu2szw2qoVUZDeFqAnyAl0HPX0+4Hr/502Z2NobkbNEtTd2PehHP6OOVl/1wK6sLERK5EaLqPtaj5HJRTaFCMFCg/sMZVeKRjO6jmzPukZrBZwQxsteUadncGBCIe+TQRSgWMNcvw4cDYjXLQbhbpZ89tHoaVM2RrxSAq30Ed3AljBRBd9q3Hr3li0VgCXsTp7EfgEt1UefaRmcqnFL4KBox4n59o3bpJ3ng3ugLQA3/wF+UVXzgN7Gfx1gJD402v2glpKDrgeTWk6PrNLq32vimcZE5dH7WrQj+Vp0wSWfK38+FpvlNcpSVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nAd3hC6+9tYVMt8Hq06dVqDUgM3EOvSCsg7PgsPCOtw=;
 b=Cj08KNkBbxZ75iORZfPtZqSZv9OD0B29dZcQVfbrz8z7hrDizheV5W4Pq0HaCicoyjj8atFyP0hszfIN6s43Zqu2CGLmnVy9va88u+l3bCCnffw2Gr0OlAmDzvZxtnBlGbhkSzIXrF8KO64OAStJvaVYNRxP1u4lCZ2bAWNKEBanSsSlShjfmr2NwajnZWSrU6yVI6thog/Z6xEg0ww1wKzHtoHDARfUOFh5sxEYc6z2mHKoLppRT8IuYPxhbDaFpB3WETgbZvzCvrMMVYyAo9Z5CnNdZPpPIa5HU47wp08QA35VJYPvvNlje6icaXlaW/mtaRwPFHiDd4afRLSdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8183.namprd04.prod.outlook.com (2603:10b6:8:2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Wed, 29 Sep 2021 22:00:39 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 22:00:39 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT
 status
Thread-Topic: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT
 status
Thread-Index: AQHXtX1wzF3QB0SC6EG5ofzLnY2pNQ==
Date: Wed, 29 Sep 2021 22:00:39 +0000
Message-ID: <20210929220038.GS17315@packtop>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
 <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90de20b3-e77b-47e5-9080-08d9839492f8
x-ms-traffictypediagnostic: DM8PR04MB8183:
x-microsoft-antispam-prvs: <DM8PR04MB8183931B98C001B424AFDBCDC3A99@DM8PR04MB8183.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U4MJaYK8P7N5cy9b0b+NisAEZmqXCzs34R24DkWmKA6jUaVklVY2mFLX3qT9AmKPo8R3IvZQ5IobhUDoxNCRAt/1X9leVfJoySvVS8TRnBO8dNv9wzdcOx27AK/LYUhZtC+sUZgKz3EfYee+Xnb/Ld6vUCY+buqMHAqt+q/TIRAB/SMhopUAqLkiwmXiO+JJVINQKtJm1VJzGcPlAia7z1Xo3UBw2doykoY6cKuJ26GlaJAU5fNCxXEn1l66P738GDtL9kxWPVS0NQ/Hsy9OcAzejYohx+2YJRRf5wIVFr/KUBPe8/AyGuTZ0C4DV7GS+pedA/9sM8VC1FilYLI0ZgObucdkOlBaL4lPOF8WKpUu0zm1hs/APfDNbr75vwyytgODlIC3PUDC3CS+zsVtDMbf19IGQff6wfZUwWV+3Jza/TJoindPhKj+RIkVgUCS4GyqwOYUHpzBJ/eiKwe75XStx0BDvvlqQ0EqDK6ai2V+Qrm4yfQrOEwiMZ1Vz9Q+4wy3i2jLAgVP19VcSvz3avpck5bs3HgkeU8vwG/c24BWtEJp4gnJ9jfQJZlfmkZxW6q/p81ZATYwbQzFpg1UY7GH7hVs1fXIeiVz0fJI7lwz0bXfo8WZgGdoCOlBwKmjx/bvyOG/GJtjpbKT+rO7r3d5WGhYz2ihZqneyOawnbXF5KBjyqjCbrRUN6yiOJ9NMg7Kf9de+LOvlbDDNiU3SA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(6512007)(9686003)(6506007)(5660300002)(4326008)(122000001)(38100700002)(38070700005)(83380400001)(71200400001)(186003)(66946007)(33716001)(66446008)(64756008)(91956017)(76116006)(7416002)(66476007)(66556008)(2906002)(8676002)(1076003)(33656002)(316002)(54906003)(26005)(6486002)(8936002)(86362001)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ljRbOsUboRe/8iu0ep+lQ/qFOqJxnQwpG0o33FS3Lni4pm7fba5RVD+Ui2?=
 =?iso-8859-1?Q?UtYQmwoB61kWC736GvyXaetGStHOLoxK8ewRUiWQPDqLeQkgM1ECdEQA53?=
 =?iso-8859-1?Q?hD2iU19SCaGmysba8Ho2ma5NeQsPopEcfgFf6HJ5nsFDcRqIvqOmmxZ/2e?=
 =?iso-8859-1?Q?k25cgYptwuj8q1QHvs+3WedYhaRUOnLprhhaZT62LB8hU7wfwCu6fmNtML?=
 =?iso-8859-1?Q?/nOVVdNNZ01vbIcJzN92nKGf5iIWGZTBDueDtg2Kv2CV9gMD82G0IyerHy?=
 =?iso-8859-1?Q?WsaPcygbCaXdZPpK3TDs+Jeba7iwwYRAe3s9fBNEKmXf/XASoPX/JycMhK?=
 =?iso-8859-1?Q?su0xyQxjiruCfNIwGMcwuOCMNnollaogwg58PJExR0ssmmPB7lbi0U6GPd?=
 =?iso-8859-1?Q?NG2V09Ai1SOvA5LQZO1uM/fdvQWoxMobU91ObKGtMvL2NlP35X+yGEWb9V?=
 =?iso-8859-1?Q?mhZCd+6ZK2imxRzKT5JWYvEYlzlmxSDAj47RyvmclQZVYayy8eL6TjGJ8b?=
 =?iso-8859-1?Q?Wrop+eNdg/wR1tnwOKIEH1Ihyllb9TaAh1Y75o+jzpo3+zTAHdz6Y2Fsv8?=
 =?iso-8859-1?Q?K5PKTXv10nAVGsP5XcdOQA2HjoJRI3CzTK/NldX/bbvDVR424DON4a+sGG?=
 =?iso-8859-1?Q?k+aSklwk4yEL0FXDJhiuK6/0JLExFDNqGXku8TAF9pcIkv/+viwnxDy4vF?=
 =?iso-8859-1?Q?/bxfoRKAWYdgIIbuHw0M+cpppA1UqQecVaYsh/2kROYZMb9OpZWJBVotCf?=
 =?iso-8859-1?Q?M/sj72qu8jBtsar020s/K6JlxkUZOsqANvw/LGGsUQsqoNCkVIvJb/lvOi?=
 =?iso-8859-1?Q?NlcU8ri1YPgQ4D0WmVqOkeOWQBnEaj/byVTPrhhepzKO4vKtIdebwMJYM1?=
 =?iso-8859-1?Q?btPxWyW2xe7h5oheT6yxLzBynLVCJsatjZXvLsQ716LWB4O1SWMD7MSx4V?=
 =?iso-8859-1?Q?1hmtt1xcsg8hp1LN7U42aVNY5KSxrQ9tPRK5OWLumK9JjVf5iCagpXBjcm?=
 =?iso-8859-1?Q?AMmosiZbTWiBSzD6QeRAIIScrzEZx9l3uGHSes3AnH6+zsZTbyMx3Kn8dQ?=
 =?iso-8859-1?Q?iJZXkwr7MJPTjncUNv+ksf2AHyPuL3YRPJTasVywHvczqXcmD03LjeG8yv?=
 =?iso-8859-1?Q?yFBfc/fqlT0p3u2LYFxewsRV3iHoQXgSKzB3u3Bjhemxkt4zAsnRZlT1fU?=
 =?iso-8859-1?Q?VENNM9hZ62mZCtEv85IqOyeiIP+XUpOgJRktkuc7ZLOZmzWlK/xy1XEfxX?=
 =?iso-8859-1?Q?PyMIu4r2DVA++T7cvTNsc9NtYPrD+mDvy1Qqyr29M2MKf8V3O53BuCmz3Q?=
 =?iso-8859-1?Q?k+yxJW2a0QCR6hyf7UqaliraS2InXPfc6XZWRoJIu0iut+U3P3UBwiJDdB?=
 =?iso-8859-1?Q?N/mdhJ8RGE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3B0506D33DDF9740BD32F9BD8AD1A497@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90de20b3-e77b-47e5-9080-08d9839492f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 22:00:39.2364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSU8YrEecd5C1VM+hfHQI3R53GNHQbOarcBzPrj3Afw4wl/FaOuu+5AjN8udmAHPOSG6Iq1EdQkFZbmzCPdEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8183
X-Proofpoint-ORIG-GUID: LWeCFegyco8CltO6ZFaikpLoY6R7LGlZ
X-Proofpoint-GUID: LWeCFegyco8CltO6ZFaikpLoY6R7LGlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_08,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290130
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Zev Weiss <zev@bewilderbeest.net>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Richard Weinberger <richard@nod.at>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 09:08:03AM PDT, Rob Herring wrote:
>On Wed, Sep 29, 2021 at 6:54 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> Hello,
>>
>> This patch series aims to improve a scenario that arises in OpenBMC
>> and which isn't handled very well at the moment.  Certain devices, the
>> example at hand being the flash chip used to store the host's firmware
>> (e.g. the BIOS), may be shared between the BMC and the host system but
>> only available to one or the other at any given time.  The device may
>> thus be effectively off-limits to the BMC when it boots, and only
>> usable after userspace performs the necessary steps to coordinate
>> appropriately with the host (tracking its power state, twiddling
>> GPIOs, sending IPMI commands, etc.).
>>
>> Neither the "okay" nor the "disabled" device-tree status values works
>> nicely for the flash device this case -- an "okay" device gets probed
>> automatically as soon as the device and a driver for it are available,
>> and a "disabled" one gets forgotten about entirely, whereas we want
>> the BMC's kernel to be aware of the existence of the device, but not
>> try to actually do anything with it (i.e. probe it) until explicitly
>> requested to do so by userspace.
>
>While Linux treats 'disabled' as gone forever, that's not exactly what
>the spec says. Either disabled or reserved could change in theory. But
>I do agree 'reserved' is the right choice for your use.

True -- the spec's description of "disabled" also sounds like it could
be an appropriate fit for this case, but the existing (somewhat
different) interpretation in the kernel is well-established enough that
I figured that ship had sailed.

>
>> However, while there's no support for it currently in the kernel tree,
>> the device-tree spec [0] also lists "reserved" as a possible status
>> value, and its description seems like a fairly reasonable fit for this
>> situation:
>>
>>   Indicates that the device is operational, but should not be used.
>>   Typically this is used for devices that are controlled by another
>>   software component, such as platform firmware.
>>
>> These patches start making use of this status value in the aspeed-smc
>> driver.  The first patch adds a companion routine to
>> of_device_is_available() that checks for a "reserved" status instead
>> of "okay".  The second patch is a small MTD adjustment to allow an
>> unregistered device to be cleanly re-registered.  Patches 3 through 5
>> modify the aspeed-smc driver to allow individual chips to be attached
>> and detached at runtime, and to avoid automatically attaching any
>> marked as reserved.  Finally, patch 6 employs the newly-supported
>> status in adding support for the BIOS flash device to the ASRock Rack
>> e3c246d4i BMC.
>
>I'm not sure this should be MTD specific. There's other cases where we
>may want devices to become available. So the question is whether there
>should be a more generic mechanism rather than each subsystem coming
>up with their own thing.
>

Agreed, and in fact in an earlier version of these patches I had
approached this via a more generic tweak to the driver-core code to
inhibit attaching drivers to devices marked as reserved.  The problem I
had with that is that it ended up being kind of limited in how far down
the device tree it would actually take effect.  For example in this
particular case, I could mark the entire aspeed-smc controller as
reserved and prevent the driver core from binding the driver to it, but
nothing more fine-grained than that.  If I marked an individual flash
chip behind that controller as reserved, the aspeed-smc driver would get
attached (as expected), but that driver (not the driver core) is
responsible for inspecting its child devices and attaching them, and its
existing probe routine only checks of_device_is_available() and hence
can't distinguish between reserved and disabled.

So while I should probably reincorporate the corresponding driver-core
change, I don't see it as a complete solution, and I don't see an
obvious way to achieve one centrally without requiring modifications in
individual drivers, unfortunately.

>There's out of tree support for applying overlays which could be used
>here. The issue with it is we don't want it to be unconstrained where
>an overlay can make any change anywhere in a DT.
>

Yeah, I'm vaguely aware of the dt-overlay patches, but had been under
the impression that their prospects for mainlining were fairly dim and
hence was looking at alternate approaches (of somewhat more limited scope).

>Another possibility is making 'status' writeable from userspace. It is
>just a sysfs file. That too may need to be opt-in.
>

The sysfs file you're referring to being those under
/sys/firmware/devicetree I assume?  That's an interesting idea...in
addition to making it opt-in, we'd presumably need to restrict what
state transitions are allowed (maybe only okay<->reserved?).  Keeping
/sys/firmware/fdt in sync with that seems like it might be a bit of a
headache though...perhaps that would just remain a static reflection of
whatever the state was at boot?


Thanks,
Zev

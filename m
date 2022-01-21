Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4C49762E
	for <lists+openbmc@lfdr.de>; Sun, 23 Jan 2022 23:54:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhpN43Nx2z30Lp
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 09:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CXiZmr4N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.115;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=CXiZmr4N; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2115.outbound.protection.outlook.com [40.107.92.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg5q36jFMz2xtF
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 15:23:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EykAUKS0PYX9zpXLTaLZS9u3atQzldaBPHrgkU9Q57HJqZNJBqX3neCsTbvIafNGR0x76oZJcsWvBcio6muM+Jkv0PpRKWl/P+QHsk9Vm0MBbwiVx1kXb8Dq61Gthj69SAKB/I+2mFU+sJmSI8IJXxPRcdYPs3GrcsLdRgi65o5+SDmSL5HUgg6YeteiDB6cpBRvs4+6NZR74nD999LF9X+DM39xwzJv+VSqWvpLlC9D3K/ZMbBFUfKWzwHQVIUED8QBcJIRTVmdIGqNQy4osrdgve0UCyq+0v5dt2c88ULEdS3Wj2wCb+QDbX1+NyGHzsERnWN4TxPDfkKiNzWOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUK8wlhzX2ojkQHE/jUQzdjn7USmqrClF9pci67V9cQ=;
 b=QfVZeYT2ZBK2iJSePj2y4CGfQxcXuWvzWRNLNN68BZrDDCTbUWUPnpLYUsnH1acsB1dLqdngw2UbhWOw9ux89qSZ5Y67PdOykDhfeM2iojVRg05wtE31eTrFnBVE0N4ZWL5AIQAZ5RFZZaXOqDWpr+qykoq8AJj4FDbqEgWryiUWhMA/3R3Nx8wglVt3+8iLj20teXPWnev02vnJVyobLL9i4OvNogmwi7+8o9uj8cTbydiKGURZ5KTW0I/2VmkYDKJYIz4PFTTnMZShghzs0Nq8M7bfUd27aAHaId9tAX/WBm8RlQGwkt6cvJ9uL2zEWeEjdc9QksFOicF6rONykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUK8wlhzX2ojkQHE/jUQzdjn7USmqrClF9pci67V9cQ=;
 b=CXiZmr4NoP4ugxAUr6zq1XOEkNEtJ5GM7su/vshzRW0enx1Jj/N3pxHuocH1i6GapNVWxbFhe6Qz1GO+kto/KAmA8zXVBKNSi2eBBo1RNCrh6fFqB8RksIRoXk+G5ylxF6cURlGXBFaktuP1O4FmAOhskiQnM38sAgLT4PhrRJQ=
Received: from BL0PR01MB5156.prod.exchangelabs.com (2603:10b6:208:67::13) by
 MN2PR01MB5629.prod.exchangelabs.com (2603:10b6:208:117::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Fri, 21 Jan 2022 04:23:24 +0000
Received: from BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486]) by BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486%4]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 04:23:24 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "andrew@aj.id.au" <andrew@aj.id.au>
Subject: Re: MCTP/PLDM BMC-host communication design
Thread-Topic: MCTP/PLDM BMC-host communication design
Thread-Index: AQHYC73kfl3LazavgkaXDWxfXPa3z6xrGKsAgAHB8eKAAArjQw==
Date: Fri, 21 Jan 2022 04:23:24 +0000
Message-ID: <BL0PR01MB5156BFDEAE95BDF87F395F8AFF5B9@BL0PR01MB5156.prod.exchangelabs.com>
References: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
 <3f884ee81d2bfacf4a112369b79e7e5d367ad774.camel@codeconstruct.com.au>
 <BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9@BL0PR01MB5156.prod.exchangelabs.com>
In-Reply-To: <BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9@BL0PR01MB5156.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 700842d6-7f6d-0ed6-a63d-c7127df91998
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e29bfe1-28b5-4a38-900d-08d9dc95c3e5
x-ms-traffictypediagnostic: MN2PR01MB5629:EE_
x-microsoft-antispam-prvs: <MN2PR01MB5629AF042D914AB2303690FBFF5B9@MN2PR01MB5629.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Khvm8corRIPf1FpIMBCHG2NZaPKfygzitx4kSYBjG/35+oe3tocjt7aWc9j5ntKGyDPJFkI08j0Tnhip/mNx57eTzJ9gX5bMCvAWdiyiwkhU5agYdVILY3Cg84Dgdk1DW5r7/RzNGA4s8osb6hfKo/s4lhduBI5s1mSc9Zpcit6wQun2lvzdhzuXfIe93Q2194TdBsSjT2fT7qTaZemXZKOoRR2lFaZsVnC1bpQIgBglArf78jopxtoePz4ANK8FIwCiJKzkJRVeNne1PKVVl7JipekMHjvBrGI5teFf+CWvIc/jNfNNnA9FHNiYjyzwyvYIRR7yGrd21LAzYvKIIKvnJ7gVmjChMN6y7ilr/xdxH2pRyafUWAxouDxYJAF+UmHJbD4h0h7Sua24Q2e23ibxeZ/dmyLkXp6Qnd9eRmy2n7jeTc5fimufmuAaS8GUO4Zw2P6fpFn0iIEcQpS9CL0+s2+Catvjm9q6llELoDk+A7VumeJ7YAIBkBY6Do+Ul3glFeoulNllGma/BfJkv28Xkr7SaloSwaXTVs7KigBcXBrBpkZIqgrH9xA2Yjt8m6MtuS27rRssI4/l3Wp1r9cHIjXKGsPfUoVbx7m5uc00FOxA/ckcxXBqZo+WfEYWxVCpKQ4v61HWQ7+yKGOZsarTtvir5N2/oBkRmYmeD9SGma3Wroizo8Nbu/7VnvAp1ligWXpXr4OZWSJEkhQ5i1f7xA9dwpyqeD28XdT/uP5IkWPYvdQHlhy1SKp5hcTyGDosugK+jXiUWo55QRtuC3/b/6K8WVvUf42qwmzwTZsj34lZFzZTIyIxTxvp6SyFO9fP9XR5xAx+3y8EuNfQpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB5156.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(66556008)(66476007)(66946007)(26005)(2940100002)(5660300002)(316002)(7696005)(508600001)(71200400001)(64756008)(110136005)(186003)(83380400001)(66446008)(9686003)(33656002)(91956017)(76116006)(4326008)(54906003)(38070700005)(8676002)(38100700002)(3480700007)(2906002)(6506007)(53546011)(86362001)(55016003)(122000001)(966005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zk6BaFREolFsaLH7tHxf0xBmfYyx9mww90LGn6sOFYF0tOa4WC26Jv2RBTnZ?=
 =?us-ascii?Q?vlJaFZbYOPNWMX2wXngyuSuC82zqwyLA5nlMQX9Zn4yVZhYcyBbHBcw2dGsm?=
 =?us-ascii?Q?5QC5lamezG5elb0hFnGjeynvoSXzo7K4VXXvqBGnoa26ESImoj6MvQnDHSh0?=
 =?us-ascii?Q?x7cwBeT5ghMi2/2HMn/Sd1XgMarFPWnClBJVcOXmrANq0AP9EEi9qxf+cIxZ?=
 =?us-ascii?Q?tAcv7m7aOrtm9UxiMIHAVO4u8Nt37Wf/BCh3PZ0/cZfjnNcSalI2FMMl7Ay+?=
 =?us-ascii?Q?GV2Y8UEQNwMCR6SRUzLqiqS33TAV7LEiJEF02en/7LIvMbEcI9TJOW+7zjxd?=
 =?us-ascii?Q?0Y6OSU+Rm8vbDWSaCVmNrgVZ8iWo6A+FknQRWif5+oaAKFj9WyD5X74qk1Nw?=
 =?us-ascii?Q?YFkUNHlFb3yp7ju0GDLRo8D0+IM9ButuRCqliSQHtwj5uUX+fdWD+hgklCRY?=
 =?us-ascii?Q?Pg6t7m8g3D3ecE19e2tH6T740Wl9Bnf82gZGON+XffvFq9v+3f39bXP2jUWQ?=
 =?us-ascii?Q?w1+40XjBeKhLgFLL42AwcL7oEBeEG1pdm2nl8VTLHUeQOHlCpp1RWgbDKoA/?=
 =?us-ascii?Q?Pv0mbym6uwWRnlfr8TCoL8tRPcRQ5Su9/UU3Ze9HgvD+OUUNzol3HmEFxyn5?=
 =?us-ascii?Q?3TeLqhF/kYIYaJ2Cc/lW2cPiXD+RWm1sGYKhR/sgeLEb48cLZiGjRJaXhOGa?=
 =?us-ascii?Q?2FoqP/bR3z78r0qgON6Yo8oBnDf0c/Ud5hTmw1IBDXJ8mBd1ehOR9jQHREBs?=
 =?us-ascii?Q?loKO1wgcaF3ZhzsU8Q9b2NYGaXcfCf/e9G+fsEL46I6A1wVu6XW8Jdm99N+Q?=
 =?us-ascii?Q?n1G7t7M+MgpM3mCcQVzSkZ7v3P3fDATjfDNnQS8Ur6qzPOxxQsWVGu2zd6os?=
 =?us-ascii?Q?zOcHLMW2r2VFXBhkeEZPcdV4J7wVk93IrzLbvVoguDo3LtrFbZzMJbTlX3i0?=
 =?us-ascii?Q?3u11erH3/J6ylnZEiA9kj7DyXWnZbQYnkMydM2kzUApqlckRc53l4xrra5Cr?=
 =?us-ascii?Q?lUjzSaqlvBYv2+CH7urGQWxkZHEPW7EqMSTQtswMqm07ZZJgZO3SHcO/5kJw?=
 =?us-ascii?Q?CUvgqm0rqAz65FrjBqSo4jQ+e6PH1ggUF702qHZbHPaT39lU6hkDy7t6kms9?=
 =?us-ascii?Q?h66f/kf0fDb+J4vk+Vd4pcAa2rORRDPtrVDk+D+WFn7fdHBUkauhs7OKErLb?=
 =?us-ascii?Q?tJbmNolxBxKKq4FyEptmNBLyzaOtMSKfXQlUxHzgYXbJ7x/RtINqBwtSc1Qi?=
 =?us-ascii?Q?bnN0Eys15CWNMLzH6JSPx6fx4SFliIDr56yZmcFej1K6IN22G7ukE7VISmy8?=
 =?us-ascii?Q?/mPdcxNPphc9wioVYxoqAg0NXVmuigs5RaatDRiXUkC9bFJhKupW22DQh/X3?=
 =?us-ascii?Q?QrqXXJG/Oy0hwLT8l1V5BInojJ85tnzJG3K2YQLqiqw0v8gFeHsdBLzGtoKH?=
 =?us-ascii?Q?3o7Bi1ll/m8gguEKd1XgaNbyXpzSBTE1o/nhXwLzsqLp5VCWskXCLulVg5cL?=
 =?us-ascii?Q?55nXbcWxZT98TF037rismkq5FQsf5CS2LdrAGOsYUUP8/zSJJ4oSXJRUXZhG?=
 =?us-ascii?Q?C0DI1AftxcgJQ8E5glQogXCZDehfDiZ61P5BQZcBq7QfZlJrL/ZB4nP8DJTJ?=
 =?us-ascii?Q?At70gw86U75mxxgUtdZ76pUCM+mIl/b4b58tnqWJ6MuA+jHoejPCky8DjgQj?=
 =?us-ascii?Q?2CLvPz32RDT8jlidM0liC3vvBiPSSxKrnTAlLm9O54nJT09b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB5156.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e29bfe1-28b5-4a38-900d-08d9dc95c3e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 04:23:24.3225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWQCCGhqnwbqYrw3ekrAd0zxIEpJBoTm0a1339h9X/GAOAe4ZwzBsW0VtwfNpJwX4ES2+rc7la+NEnEnIXC4Jst9PMxrAlItygmeNmmHeeyvtPhzkRqdt/GbBdmqE41J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5629
X-Mailman-Approved-At: Mon, 24 Jan 2022 09:53:37 +1100
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jeremy, Andrew,
Appreciated of your comments. We are using the userspace MCTP and will cons=
ider moving to kernel space MCTP as the suggestion.
Because of the specific requirements, we look forward for simpler way. In o=
ur case, we have on-chip sensors and events which are allocated in both 2 s=
ockets, and the situation is: we must send the PLDM command to poll the dat=
a.  If using 2 interfaces to communicate with host, I think it would be com=
plex when sending to multiple sockets.
The things should be considered as :
+ If a socket is problem during runtime, is the process of MCTPL/PLDM still=
 ok
+ If one, or more socket problem. Can we reboot the whole system to recover=
 ?

When using 1 interface, i think:
+ From the host side, socket 0 (master) should manage its other sockets, (m=
ight be not via SMBus, but other faster sockets communication). Of course, =
the more work should be implemented in the firmware, and you have pointed.
+ BMC just recover the system (via reboot) when socket 0 issue, otherwise i=
t does properly

Do you think any more issues with the communication performance ?

Thanks,

________________________________________
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
Sent: Friday, January 21, 2022 11:15 AM
To: Jeremy Kerr; openbmc@lists.ozlabs.org
Cc: Thu Nguyen OS; Thang Nguyen OS
Subject: Re: MCTP/PLDM BMC-host communication design

Dear Jeremy, Andrew,
Appreciated of your comments. We are using the userspace MCTP and will cons=
ider moving to kernel space MCTP as the suggestion.
Because of the specific requirements, we look forward for simpler way. In o=
ur case, we have on-chip sensors and events which are allocated in both 2 s=
ockets, and the situation is: we must send the PLDM command to poll the dat=
a.  If using 2 interfaces to communicate with host, I think it would be com=
plex when sending to multiple sockets.
The things should be considered as :
+ If a socket is problem during runtime, is the process of MCTPL/PLDM still=
 ok
+ If one, or more socket problem. Can we reboot the whole system to recover=
 ?

When using 1 interface, i think:
+ From the host side, socket 0 (master) should manage its other sockets, (m=
ight be not via SMBus, but other faster sockets communication). Of course, =
the more work should be implemented in the firmware, and you have pointed.
+ BMC just recover the system (via reboot) when socket 0 issue, otherwise i=
t does properly

Do you think any more issues with the communication performance ?

Thanks,

________________________________
From: Jeremy Kerr <jk@codeconstruct.com.au>
Sent: Thursday, January 20, 2022 7:53 AM
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>; openbmc@lists.ozlab=
s.org <openbmc@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS <thang@os.a=
mperecomputing.com>
Subject: Re: MCTP/PLDM BMC-host communication design

Hi Tung,

> We are using community PLDM/MCTP code to design our MCTP/PLDM stack
> via SMBUS on aarch64 system. Basically, we have 2 CPU sockets
> corresponding with 2 SMBUS addresses, and the MCTP/PLDM stack looks
> like this image:
>
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd393=
03bbb6e9c8a6f646/current_design.png

That looks good to me, but a couple of notes:

 - EID 0 and EID 1 are reserved addresses according to the spec, the
   usable range starts at 8

 - therefore, the *convention* so far for EID allocation is to assign
   EID 8 to the BMC, as the top-level bus owner, and allocate onwards
   from there. However, that's certainly not fixed if you require
   something different for your design.

 - you don't necessarily need two EIDs (0 and 1) for the BMC there.
   Even if there are two interfaces, you can use a single EID on the
   BMC, which simplifies things.

> Due to the not supported of discovery process, we are fixing the EIDs
> for host.

As Andrew has mentioned, we have the in-kernel stack working, including
the EID discovery process using MCTP Control Protocol messaging.

If you'd like to experiment with this, we have a couple of backport
branches for 5.10 and 5.15 kernels, depending on which you're working
with:

 https://codeconstruct.com.au/docs/mctp-on-linux-introduction/#our-developm=
ent-branches

It's still possible to use fixed EID(s) for remote endpoints though, if
your host MCTP stack does not support the control protocol. You'll just
need to set up (on the BMC) some static routes for the fixed remote
EIDs. I'm happy to help out with configuring that if you like.

> A new way that is considering is like the image:
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd393=
03bbb6e9c8a6f646/new_design.png

That looks like it has some considerable drawbacks though, being:

 - you'll now need to implement MCTP bridging between the SMBus link
   (between host and socket 0) and whatever interface you're using to
   communicate between socket 0 and socket 1. This may then require you
   to implement more of the control protocol stack on the host (for
   example, as you'll need to allocate EID pools from the top-level bus
   owner, if you're doing dynamic addressing).

   That's all still possible, but requires more firmware you'll need to
   implement

 - if there's an issue with the socket 0's link, (say, if the host
   has offlined offlined CPUs in socket 0), you might lose MCTP
   connectivity between the BMC and socket 1 too.

That said, it's still feasible, but I'd suggest your first design as a
simpler and more reliable solution.

Regards,


Jeremy


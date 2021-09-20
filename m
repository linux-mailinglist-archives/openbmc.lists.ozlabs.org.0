Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C226D412739
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 22:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCwq14ZTZz2yZ2
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 06:18:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=mp8yRDIZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=mp8yRDIZ; dkim-atps=neutral
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Tue, 21 Sep 2021 06:17:35 AEST
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCwpR6X8gz2yNL
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 06:17:35 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221341718"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="221341718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 13:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="473782557"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2021 13:14:22 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 13:14:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 13:14:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 13:14:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 13:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biHI3Ed7r2dBkuUyqDgLzruY/PfujdvabQDxZtKV7ZrB71c0g4Gz0M8R16O7BXLngc9Yb1oIQi6zzlLqem0fV9b6OM0STM9i2N9lIhb+UZ1EWviOBI0z3Ed1EOZJb84ksKzsIHjWqjffpa3vQTnCmPGSvO4ZbTJ4FryNr4dZdyy50vL2ElneEBN4X+l7+nBX5B19DkMaL6kARwoXoBOOW93NFGOu4WWMuEQMMlNX/4MMgwESK/zS06TEhAcH1g1ZrS1OzYwFKAX9oOB5O4MhjpfdO43j1gPcXWKKP+SzB1wyuQ4/YGGb9GReOP+JDGZiMeLmu+W5UO08+oI8Vy20LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=AYJAPvJvhJCzw5c/hRnDNNkoO9ImnCe89Imss+HpVEc=;
 b=dn/lZfUqFghYneMOToRkPmc3184AjIA9B8wZoLMDscODqnAV3gt6hdlym9SLv0hLwhX6c1g8C6daPY3M6qbd3/JwS9ZP29B3MOv71EvjjyK7UBYvKyOHgjopcSLBeg/Ou5wmz7cQqNE3R4chK3dAj54GWaombP9UXj2peP2r1fmb3Pu1dlEsY4RsrAti6sb4GOEOJ6PS8IV5BlDJ44va+cgBLgSmTjYoc/exFZWmJmK2YpNYIfFtjas4x83MWywsylHKRoJLhquD1SFKFGewqquQ387C1f7OgqL8pprGlxkhY3gTvAvmYYI64MrUNvwHOMU1nE0yjDGzCpniO/xCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYJAPvJvhJCzw5c/hRnDNNkoO9ImnCe89Imss+HpVEc=;
 b=mp8yRDIZAFrbzLWU32bZngZNKqruqo1xDB0TWcXL+9y3EAWjk5RagP8sJB3gAYEoCfv3Aby4SK0x8QHqVwdyCmTC8PeOyniUq/lqSjRLeFY89/UUTM+T4OCuolrJRNnZF/+9s23MpYTjMNpv9OVIOt+67dNxehgOCPkkIX7wDFM=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB0042.namprd11.prod.outlook.com (2603:10b6:4:6b::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 20 Sep
 2021 20:14:21 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 20:14:20 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: beep code manager  for openbmc
Thread-Topic: beep code manager  for openbmc
Thread-Index: AdegNz4ix6KDZmesSHKifuGcFpVNkQADnnSAAR+hl4ABOnONgAErWu9Q
Date: Mon, 20 Sep 2021 20:14:20 +0000
Message-ID: <DM6PR11MB4410ADC2C1B49B72963208B594A09@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <YTFJHVW+bYoa1vIT@heinlein>
 <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>
 <YUERnyjg7LUsL/ca@heinlein>
In-Reply-To: <YUERnyjg7LUsL/ca@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 747e1290-2be8-4b2a-d48b-08d97c733b60
x-ms-traffictypediagnostic: DM5PR11MB0042:
x-microsoft-antispam-prvs: <DM5PR11MB00421B86A3CE4E629A7C89CF94A09@DM5PR11MB0042.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +DeCesUD8DPr5hxMhcWpW3ub/HJo9GcKRyn0nCHk5sGPY4GwAYXcMlhFRnzOvaLNS4Khis2c3gy51vhYFoVmIS05t3e2SxNGOeyR8S6Ie3ckHQwoQ3yPUWZlBf8f/CHSJBlx39d0AN2QY7VQlaabUOs6qt/FoyGBPzCBzjI0YBxCx32ERJ4n5u3jBvLneuxZ5x3pSfRwoAGe0ZU69jDUxcwCN0lz1zciYoLHJU5cwdc4WEYG7iE+LtZnkvtylaM8ahgNJ9wgxKlV+wQAx/pzuXjDtRnJ+iLkPQENZsNInPCT3j3l7dA0IAhmF+D3aYx86J4u5s87JzSNOIWLGligkQWLkLAGDFNA4Zbc0hieXBtmNQ8WIYhD+DwabOtsNb/pmgrMaZ6p2Af7aeAVAd1uTO62PLPc913LNPU6m7gZ7XLEwpnmxBJPxIpth7uKzwwkpP6H/CARkKEvWtl9nSOYu6Vf7UHxsAdk1qiLMu9M9pyYmPXVWLOFgLSsiHAlTZySvOyyt+WOSHpjen891+24avdtDdqtaW7xMdIZlImG0ZRAiR6bEyz4KqcGbo29UqXoUuS1EF1ICHfsL6lWuYcoeZoAmh/3NMPxKUfa19KriBWMMITNycDPrF3HbHZAL7ooWzU5IPkUzJgL91owmG05XpjUbS94j6kwMrRZeDZcG2gJn5YOUbp6+eqRgwWfHHSwYRNAthDeitWRqLzzd6dZHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(86362001)(6506007)(52536014)(5660300002)(55016002)(66946007)(7696005)(26005)(54906003)(2906002)(8676002)(4326008)(478600001)(316002)(6916009)(66476007)(33656002)(186003)(76116006)(9686003)(66446008)(122000001)(8936002)(71200400001)(64756008)(83380400001)(38070700005)(38100700002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NouvxU/hTX7ENj8BIyuUAtW891EqZhnj1r0kTCtlHf+h+5EVGITsqH3nBubY?=
 =?us-ascii?Q?qdfAjFlnhZbABKrp/C+3cva3XYA98oOqch8asW0SOqsDiQo1FW+NfxIhlglI?=
 =?us-ascii?Q?idPDb/+hs54hsgnE0gk5CaJwH+Hby4RkEvvpZfgENhL758GBXLw6q9byVVxH?=
 =?us-ascii?Q?Y5VximvxekITUDh01vD0ZjLfYHk2P4+CFIqP77zm3IKGrjLp9qua6oQWQ2zx?=
 =?us-ascii?Q?w7o+ouT8sWb5Xe3cavU8tflykZlMVj31yEYsznSz7qPHLfMp4ZtnxRunTsLC?=
 =?us-ascii?Q?wK74TVwMmWYMkMyUOEPNN6A/5GLs3P5nYMbWwoCt6flEmOJS3UN24fom0wCf?=
 =?us-ascii?Q?1Htr2faSWdtuB04wfHX+l64f/ZS1xV4Jucy+I63OXx3avnwigqi0jdMu87P+?=
 =?us-ascii?Q?4ajU6jIy/HDceqXs5MOwdKcB/QIU126zjPEirxoBM0WsgrkTo/DJUaBSyoyb?=
 =?us-ascii?Q?1W+w94tlMUW1wIe70XCiTP0HfdyiH8YYf6P7Q09d9WJ4X0H6wh/M9u6WmKXU?=
 =?us-ascii?Q?66gzsIoAdInFhatyV01Yl49Okcgv4EBAxn9nTgrVe5QU51AbRrKc+AXANZ1b?=
 =?us-ascii?Q?Sg17bjzSli5PLAk7ILwwVAH3QoC5SwC4JUEqSg7HE5u7ArZ2EuAloYzqj/bp?=
 =?us-ascii?Q?Xz2YCFIruPYOXuEKF3iP4BaFAr5+7dmIvBWYLsBh6YvQGq056AaVWjRi+9CD?=
 =?us-ascii?Q?xbVAEzaSnRt/3s1y1zqEaz4S1qZRv8xKurIuNffbgoDEz8CKZKPtSsLkxril?=
 =?us-ascii?Q?vggAqewH6ou3b4N6hr4QT0OPzjs7yZDyKNDJN6dikJHsnDFN+A2679z7sKvF?=
 =?us-ascii?Q?qMNx4iK9XiKhUAjkfGRY2wXCg1IQNOBjjO780yB4VxdTn+gjH+K1I4OIoZJW?=
 =?us-ascii?Q?Er5IsOOxbZm9rQVrLXbZwla5WHLj/9Z7gDqzYqRZUStw6jtYFBv7rYUL+dTR?=
 =?us-ascii?Q?dPhhHXfx4eyVwELutxaLU2goBqm/GEELw8KRSSG5MNz6S2YPIMiokEEZhf3A?=
 =?us-ascii?Q?G+9jTKAVEXHsAPRR9J9nBJi84j9iVNEjNYc99RANZfIbWMht4vbEOihaSVCP?=
 =?us-ascii?Q?Yl8JD1+IHyeAAk1x9RDYkZ5ES/TBVDMFo50Ktd3HwVUEyTtIUNy7BXqSa8Q1?=
 =?us-ascii?Q?TEIlVMNv2Vykpu/qZr/Ofvx4PN8/CvNkd14TUwObHQEMQ3cMd2VOn+VISL2e?=
 =?us-ascii?Q?Qjz4P6lbKk09VIHV2IL4u6VUCCrhKbmCKNOG4VZm222fWeS7ARkzNYE4ECcD?=
 =?us-ascii?Q?6ecWf9rYNYftp4hRXV4WQ9dD9DJfpiiEPOhWDadpYdxyMSGZZeym+S/plrMa?=
 =?us-ascii?Q?hWA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747e1290-2be8-4b2a-d48b-08d97c733b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 20:14:20.7361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGWjp2mOcX9S2/dsj92/IyI0mTWrLB/tgHfcqreUnD3FOPtm7cmLbqNSNpsbp8HpTKKRpUq/NtZvRfSdouxRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0042
X-OriginatorOrg: intel.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



>-----Original Message-----
>From: Patrick Williams <patrick@stwcx.xyz>
>Sent: Tuesday, September 14, 2021 2:18 PM
>To: Ren, Zhikui <zhikui.ren@intel.com>
>Cc: openbmc@lists.ozlabs.org; Brad Bishop <bradleyb@fuzziesquirrel.com>
>Subject: Re: beep code manager for openbmc
>
>On Wed, Sep 08, 2021 at 03:29:48PM +0000, Ren, Zhikui wrote:
>> >I see it creates dbus interfaces but I don't see them defined
>> >anywhere.  Can we get that added to phosphor-dbus-interfaces?
>> >
>> [Ren, Zhikui] Yes, I will submit a review on that.
>> >It isn't obvious to me from looking at what interfaces are there who
>> >would call it.  I see various "beep code" patterns:
>> >
>> >    {beepVRWatchdogTimeout, "1-5-1-2"}, {beepPSUFailure, "1-5-1-4"},
>> >    {beepCPUMIssing, "1-5-2-1"},        {beepCPUCatError, "1-5-2-2"},
>> >    {beepCPUErr2, "1-5-2-3"},           {beepVoltageMismatch, "1-5-2-4"=
},
>> >    {beepCPUConfigError, "1-5-2-5"},    {beepPowerFail, "1-5-4-2"},
>> >    {beepPowerGoodTimeOut, "1-5-4-4"},
>> >
>> >How do these get triggered?  Do arbitrary programs call into the
>"BeepCode"
>> >service when they hit their own event?  This doesn't seem very
>> >maintainable; shouldn't the beepcode service react to events through
>> >some other method, similar to what is going on for Redfish events?
>> >
>> [Ren, Zhikui] Currently, an application can call into the BeepCode by
>> calling the dbus method One of improvement ideas is to make the
>beepcode service monitor the events it is interested in.
>
>Fundamentally, I see this as a very poor design.  I don't really like us t=
aking
>code written in isolation without any design feedback and then expecting t=
he
>project to pick it up as-is.
>
>We already have REDFISH_MESSAGE_ID and IPMI_SEL_* journal strings, a
>proposal for audit, and now this beepcode proposal, which are all a type o=
f
>event.  The current design proposals for all of them is that every applica=
tion
>needs to be aware of every consumer and make N random function calls to
>each of those consumers.  It is sloppy and doesn't scale.  I don't want to=
 add to
>the mess by adding beepcodes this way.
>
>I'm slowly working on unraveling this by adding an Event concept to phosph=
or-
>logging (distinct from the current Error concepts).  I'm hopeful that this=
 can be
>leveraged for any such event, including boot sequence states that can be
>consumed by this beepcode application.  I should have the initial design w=
ithin
>a week or two and would certainly welcome any review (with respect to beep
>code) and assistance in implementation.
>
[Ren, Zhikui] Looking forward to see the review.

>> >How easily configurable would this be for someone who has a different
>> >beepcode policy than Intel's?  Are you planning to update it with
>> >some JSON config or leave that as an exercise for the next user?
>> >
>> [Ren, Zhikui] Good idea.  However I don't have a definitive plan on that
>currently and open to suggestions/collaborations.
>
>Another reason why we shouldn't just take wholesale code that was written
>and designed in isolation but isn't really fit for anyone else's purposes.
>
[Ren, Zhikui] Getting feedbacks from the community was the intention of thi=
s email chain.
We have some ideas how to improve the current design and make it more flexi=
ble.
I will start working on a design review next.=20
>--
>Patrick Williams

Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C74C9E95
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 08:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7mSj6H8mz3bgS
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 18:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=E5ztzkfp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com
 (client-ip=121.242.48.116; helo=inblrg02.tcs.com;
 envelope-from=prvs=05315de73=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
X-Greylist: delayed 70 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 18:47:44 AEDT
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7mS03Ht3z3bZd
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
 t=1646207266; x=1677743266;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXPCV9d+qqRhlZKJ05oN7G0/S9fwCAppUA7ndiGRjQU=;
 b=E5ztzkfpvNSi0FskvvPOmFIR7/7f6Z275xxRxorSlrxfRjMygIV8FbEg
 EAkTFE/NLtGh9i3xHS16qEb/beuwvOLO9VFJUDaBsVaGUkBL73AuXhW8p
 E7+VLgBAf9VpKaDQKL5Ot6hwi4ZcpO0Tne1EWULU9VWOtKryvs2kV8ArD
 YE19FFsUXqdKCWa05d4BrxB2cVQ4+pUV0qrH6N/NoS1rOue71Tc17UjEe
 O2j+2r19urGVbVyT6SFMNT3myQZrLNjCXTZGE+w826nYZyJZCRsUYDdpT
 S9ehq2Bfk3jcjxd3Lx+L9wsiYda2TYf2Ubummz+tf/pq2Tp98a+BuKoNp g==;
IronPort-SDR: FdLY8QvosrGjkNYNx/JWEvwf+moRBoMT8rkjIVZ6qA+NsGL2ZyTDhzSGJeHrLEkZvErvQknHvx
 QacQVDlkxJUQ==
IronPort-PHdr: =?us-ascii?q?A9a23=3Au41DTxcNbr14HWBk73dHd7NzlGM+WdnLVj580?=
 =?us-ascii?q?XLHo4xHfqnrxZn+JkuXvawr0AWTG9yDsLkZ2qL/iOPJYSQ4+5GPsXQPItRnd?=
 =?us-ascii?q?iQuroEopTEmG9OPEkbhLfTnPGQQFcVGU0J5rTngaRAGUMnxaEfPrXKs8DUcB?=
 =?us-ascii?q?gvwNRZvJuTyB4Xek9m72/q99pHNfQlEniexba98IRm5rQjcstQdjJd/JKo21?=
 =?us-ascii?q?hbHuGZDdf5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2UbJXDDI9M?=
 =?us-ascii?q?2Ao/8LrrgXMTRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4V?=
 =?us-ascii?q?DK/5KpwVhTmlDkIOCI48GHPi8x/kqRboA66pxdix4LYeZyZOOZicq/Ye94RW?=
 =?us-ascii?q?GhPUdtLVyFZAo2ycZYBD/YPM+hboYnypUcBoxSxCgS3GOPg0SNEimPq0aEm0?=
 =?us-ascii?q?eksFxzN0gw6H9IJtXTZtMj7O70UUe+o0qbH0y3DZO5T1zfg7YjHaAohquyLU?=
 =?us-ascii?q?LJra8XRz1QgGB3bgVWIs4DlJzCV1vkIs2eB9eptTv6vhHI8qw1rvjevwcIsh?=
 =?us-ascii?q?5DPi4kIxV/K6T93z5wpJd2kVkF7e9ikHYNQui+UNYZ7XMcvTmF1tSs617ALt?=
 =?us-ascii?q?4C2cTUExZkoxRPSa+GLfpWI7x/jUOucLzN1iGxrdb+hhBu/8kitx+LzW8S01?=
 =?us-ascii?q?ltBsyRLkt7Jtn8X1hzT7NCKSvR8/ke92TaPyhvc5vtYLkAzkKrWLYMqzL0ol?=
 =?us-ascii?q?pcLrEjOHDH6lF/rgKKUbEkp/vKk5/npb7jivpOQKY55hh3wP6krh8CzHeA1P?=
 =?us-ascii?q?wkLUmeB5eiwybju8VDlTLhPi/A7kK/Uu43AK8sBvK62GQpV354m6xa4Ejipz?=
 =?us-ascii?q?swVnWICLFJZYBKHiJXpO03WLPD4E/i/h1OsnS91yv7IILDvHJvDIH7ZnrnmY?=
 =?us-ascii?q?7hw91NQxBIyzdBZ+Z1UFqkMLO/xV0PvrtDUEx00Pxawzur9Fdlw2IcTVXqKA?=
 =?us-ascii?q?qCDMaPStVGI5vgoI+mJfIIVoyzyK/446PHwk3A5gUURfbGq3ZsKbXC3BO5mL?=
 =?us-ascii?q?l6FYXXwmdcNC3sFvg07TODyjl2NSiZcZ2yuUKIk+jE7FIWmAJ/dSoy1mryOw?=
 =?us-ascii?q?D+7HoFKZmBBEl2ME23oeJuEWvoXbCKSI8lhkiELVLS7So8uzhSuuBXmxLpgK?=
 =?us-ascii?q?+rY4jcYuo771Nhp++3Tkgk/9TtsD8uD1WGCVGR0kX8TSj8y3aB/ulB9ykyZ3?=
 =?us-ascii?q?ah/gv1YEcZc6OhSUgsgMp7c1eN6WJjOXVfjecyEUFbueNi3BzY1Qsl5l90Ub?=
 =?us-ascii?q?ldVH9SkkwCF3iCvRbQSkurPTLk18a+U/X/3Kt01n27c06IljkcnWeNAMGSng?=
 =?us-ascii?q?uh08A2FVKDTlEDMrK+seakRxGbu6WKK1yLap0heXAN9SePdXm0ab1H+sd/io?=
 =?us-ascii?q?EjFSun9WvwcLgJdxJvaeeNxYdrzgAADHa+7UDyWS26ymmLlAxGOy/vMaYfxY?=
 =?us-ascii?q?GwS0W3bD1RMiAEc+3uKdG1cTiesqm7TFnpiQFToZU6//ex3snjuSEgywkmDZ?=
 =?us-ascii?q?FFg0Lzg/BkTiLScRvof06hCtj0mrmBoF0371NXTWLK9?=
IronPort-Data: =?us-ascii?q?A9a23=3AeVtfFascSfbce3csPIDxSjJN5efnVJZcMUV32?=
 =?us-ascii?q?f8akzHdYApBsoF/qtZmKWnTOa3cYzHxctoiYY7i9UxQ65CAy4Q3SwtpqC0zR?=
 =?us-ascii?q?SgW8JSUC9/AIxuoYnjLJJGbFBI/v85PYILNJpk4QiKD/EqEP+m6pxGQ900oq?=
 =?us-ascii?q?pkQqgL816oYqTZMEE/Nsjo+3b5p6mJUqYLhWVnV44mu+5S31GKNglaYDEpFs?=
 =?us-ascii?q?8pvlzsy5JweiBtA1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq0Qv+5nil?=
 =?us-ascii?q?o/R109F5tpICd8XeGVSKlLZFVDmZna7x8GfbhZ+Siwais7XNdI3RWxrpxGxu?=
 =?us-ascii?q?uxYkb2ht7TpFl1vZ/KKyaJECEgw/yJWZMWq/JfcKH6zvMGLiVXFbn7l2d1yB?=
 =?us-ascii?q?1pwNoodkgpyKToTqKFAcmhQBvyEr6fsqF6hccFunMkyBM3qOp4P/HBqyHfSC?=
 =?us-ascii?q?vNOaZfbTqPA4NRw2DYrmtsIGuTabsACLz11Y3z9j7dnUrsMIMthxqHx2T+uN?=
 =?us-ascii?q?WQD+TqoSWMMyzC75GRMPHLFa7I5ouC3ePg=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AmISXy6r4xm+5Xv5PT5H7CW8aV5opeYIsim?=
 =?us-ascii?q?QD101hICG9Ffbo8/xG/c566TbfjjENVHY8pMCYNMC7L080mqQFhLX5UY3PYO?=
 =?us-ascii?q?CEggqVxeNZnOjfKlTbckWUygc6781dmsBFeb/N5DNB4voSjjPUL+od?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DJAADX9x5i/4sJEaxaHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQAmBQAUBCwGBfyh+gVWEVI4VgwIDixCRYYFoCwEBAQEBAQEBAQcBASo?=
 =?us-ascii?q?HEAQBAYUHAheDfiY3Bg4BAgQBAQESAQEGAQEBAQEGBAGBG4VoDYI1KQGDYwE?=
 =?us-ascii?q?BAQECAQEiBA05DAwEAgEIDQEDAQMBAQECAiYCAgIfBwoVAgYIAQEEAQ0FCIJ?=
 =?us-ascii?q?9gmUDDaxMAQEBeH8ygQGCFASFCw1ngV4GgRAshg+BJIEfgWGDFnuCUCZvQ4J?=
 =?us-ascii?q?nPoFTTkICgSIJARIBI4MXN4IuBJV7SgEaPwVTKw4HAxMsKBEkBpIjC4NoqVZ?=
 =?us-ascii?q?rB4NLgUCJSoxzcoECgiSDdBWDc0eLZJgHllQgiieCTINQlWsCAgICBAUCDgi?=
 =?us-ascii?q?Bd4EPcDMaI4M5UY9uAQKCSYpedTgCBgEKAQEDCZNwAQE?=
X-IPAS-Result: =?us-ascii?q?A2DJAADX9x5i/4sJEaxaHQEBAQEJARIBBQUBQAmBQAUBC?=
 =?us-ascii?q?wGBfyh+gVWEVI4VgwIDixCRYYFoCwEBAQEBAQEBAQcBASoHEAQBAYUHAheDf?=
 =?us-ascii?q?iY3Bg4BAgQBAQESAQEGAQEBAQEGBAGBG4VoDYI1KQGDYwEBAQECAQEiBA05D?=
 =?us-ascii?q?AwEAgEIDQEDAQMBAQECAiYCAgIfBwoVAgYIAQEEAQ0FCIJ9gmUDDaxMAQEBe?=
 =?us-ascii?q?H8ygQGCFASFCw1ngV4GgRAshg+BJIEfgWGDFnuCUCZvQ4JnPoFTTkICgSIJA?=
 =?us-ascii?q?RIBI4MXN4IuBJV7SgEaPwVTKw4HAxMsKBEkBpIjC4NoqVZrB4NLgUCJSoxzc?=
 =?us-ascii?q?oECgiSDdBWDc0eLZJgHllQgiieCTINQlWsCAgICBAUCDgiBd4EPcDMaI4M5U?=
 =?us-ascii?q?Y9uAQKCSYpedTgCBgEKAQEDCZNwAQE?=
X-IronPort-AV: E=Sophos;i="5.88,393,1635186600"; d="scan'208";a="35550205"
X-DISCLAIMER: FALSE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et33YNQsvvpLjtYikjU3lwRB19KTc7TT0cUld16i/2k1ILhXm/PlLBwLAX0NI0Rau31Qdc4MOqgynlAjanmQiRjXFdNvMjxgmrSuUzIVQ6DZgyf8aLYi2bkBh7HJAbY4+ej+L3yn0lLHRagQO61uaiB4KJo8IGgAdt1AwVXFHTKo6+IfC+vwhfh3PFLM+nb/yOmTSsu2vAPMm8mXyo/Urqkk4CR7i6Sy3oZ01NdGtf0NxVkaWJUm1gT4lwX11WozDE2JCdfbWTI18nsWOKRE5XZTLRiRnK4TJn1p8CTsVYTyKUO89dgkfAF+i7gzdM4plyp4jd3FYqyJ7doRq/3pQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXPCV9d+qqRhlZKJ05oN7G0/S9fwCAppUA7ndiGRjQU=;
 b=Hz2ebkO7s5fgKeaOShJsTW9QKtsYFSPH8/afrWwkV47tWg5hJYGfmMvMbvld6G+6yKRoAMe8lLclX5X6OzNfuPES39PV52023GFIg2jZ7PzEm+QoXtXrHpWRyTVdJwFJ2yiGA/EpLxABEojT82fOYV2kbqzcOV0GTE6Ul3D2YBbhkkmSEWYEsQQOjkdw0ODzHKPDXPUZdYJvd+vhH4M7OKGT6/xX3aWi+udfD+0QQzuR93I4wFMY6DRv20IjzwzVvXU2P5m2MW7J6ZHd+176KBweozHwb2/POmn/J2AbJIgrY9Jlqao6IDbk7IXyciiQAXDL1fiAfEvQC2k9rwcyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Mike Jones <proclivis@gmail.com>
Subject: RE: openBmc Code Structure
Thread-Topic: openBmc Code Structure
Thread-Index: AdgqEnoKusptz7YpTwiYMV2le+cEdgAOX80AANcv9IAAF/WaAA==
Date: Wed, 2 Mar 2022 07:45:36 +0000
Message-ID: <MA1PR01MB412924C1574DBF411E56B59187039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <CE613404-79EA-4D39-816D-B16E757CB64A@gmail.com>
 <a81d2232-e0bf-e9f8-893a-833a7e29f6a3@linux.ibm.com>
In-Reply-To: <a81d2232-e0bf-e9f8-893a-833a7e29f6a3@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1da99fe3-f5d1-48a6-b24f-08d9fc20a39f
x-ms-traffictypediagnostic: MA0PR01MB6246:EE_
x-microsoft-antispam-prvs: <MA0PR01MB6246E4A7787AAC672F55DA0887039@MA0PR01MB6246.INDPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: styPhTxbRKMDk7/fzVaOXnjEfRJQwk61fR0srNqvxomZLnRPq9mef54rOtmxP8o1ANsIvFStbV636VW0+A8wePSXaXNnuVw3BlIf+9LA34TwEUkr5Ulevuwo8Mte90G+yk9RBgXz+Qd2zmjxPTtLDFJUcIGkr4HPrZs7hLZ9VeCztda9OFmYvaQCs1+BuE/Ekzapa/XIhEcc+i4UE8aUCQNpwkf3lfmk2xzEJ607KXl4yIbz6kkGQizOPIZd+6vfjIa5CAmQKbI7iqr3ei3huNmOJEELMzBuyCVaFShoWcS4ORolA8cQe6RZjCBT3d+6sHlLAjMZCmoc+t3fsrENj7PV65NSx7JEjMNLiuH/S5YWuSXeBymiEbA4lm66FhGfuXX2Ixn2UY0RHf3c9ZtOIo7jZFhm8bydtzEGQBzjysNSTJICJlM5O7QfOnKcbEPtStqzpTIl9g+grzorUgJ04NIcwmRhRpplyXqe/7ZqINCbz1aipus3140UEHq6lvuplw3tGD//lTq5jm3QUSSw0YJH2FqsnGqFZgkzpRMOs7r4iPQK6Fncc9MvME98wIWXWGrA3bfgAjTpUc1fPOBUE+5P/xuknzJ2SMcN3JLRzuJ15tIuwOV0EwvFSf6970fqGD2nTIr4nqiUH19FKwh1oqLDpDD5LxBi3vmcdeEFiomgQ7shXP/+SJ7Me4P3liTMbYUXRbdadZuBzTkbgQWaLOuSNttRBA8UoyFOwzavlDVcvgdqBQr20BbF9+0O51T9m9UeFpTXLngr5bFDFIbLXAWjRfnw2qVvGjIf/mHst0A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(55236004)(53546011)(38100700002)(52536014)(83380400001)(122000001)(38070700005)(33656002)(6506007)(86362001)(9686003)(7696005)(66476007)(110136005)(186003)(66556008)(76116006)(66946007)(26005)(64756008)(66446008)(2906002)(8936002)(5660300002)(71200400001)(55016003)(508600001)(3480700007)(7116003)(82960400001)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFBDeExFbVBZRmpDWmZSSHhIU1dONWZZMWlrRVJBSjBqM2JKS3o2dUhJazBY?=
 =?utf-8?B?ZkFmbUpMTFcxT2dlZEhlcm15OEZNZXA5clFEV290dUROSXAxWC85Mmp0ckFo?=
 =?utf-8?B?bE44bHNybmtQM3ZBeWhkZHRGWjVNODFnOUsyZ0xsRFJFUTNyb3B2dzdWQUZk?=
 =?utf-8?B?Z2RxeTJGcVhBMk8zakpIZUtCWVUvNlFiaEdtMi9HbnkzczVzdmFLSWRVSWI4?=
 =?utf-8?B?Tk53ejl2ZnZzTlRYbUJJQmh4QVZDeWhUcTVkd25tbnZlS0tKNERzQXg2V1J4?=
 =?utf-8?B?dDNtTzJLbEdsbjBYK0xOYUpndGVLeUpZMndpcXhINjBEeDg1SmN4N0IyYmsx?=
 =?utf-8?B?NHV5SzJ0V1cweXQvNit1L245WGFEQ3pjamxva1JBRzNMV1lBREYrVThYZEc3?=
 =?utf-8?B?S2UxRG5YWVBYVjgyM082ZEJNTTh4b2lUMDlLdklEM2JuWE9sd0tOdlphaVlB?=
 =?utf-8?B?UTlyYUFlZ3RxUnJRc3lmRHNvQW82T2VjVFFZY2hRQnVvTFdJKzN5VzQ0Um1Q?=
 =?utf-8?B?VlJrenQxaUlYREdjL1ZwUnZ6QWtuRXVsWEZtMnZUMDVnWjNmVzNIM2VKRlRn?=
 =?utf-8?B?L3B1Tm9EZjE4eTNNdzB2RW1uSjVMU3RiQzRhd2VmSURsWkFnZXBKbXFOOEhs?=
 =?utf-8?B?Yi9WenBUbXZvcHRLUGR5TjloNC95NE4zMkZaU0xmQ09JcU5YU3lDRVhodlRw?=
 =?utf-8?B?WW1wdWg3RVZXYUN5NWl1emdjZHg3M2xKVGdSSmsvSnF5dXpHQkxoUkI3NHVC?=
 =?utf-8?B?eXF5U2dQNkJ5TDRub3FnWktrUnU5MGZBRFJWOWNoSnRZcHhSc2tkaEhvcUE2?=
 =?utf-8?B?M1RIV2F1WmJHZFMzS1N6azlnSG9ZWXVWYWRMRi9vejR1MkgwRG52S2ZXcVhO?=
 =?utf-8?B?TE00Q1dQaHRTaTl1dFRnQkN6YWpqeDJ1d0cyUytYNmdUeVFpNk5MbktDdThU?=
 =?utf-8?B?UUxkU3NqblpBV3BMSXdaUmtxVUkrMnRUbExxaUIxUWdia05UTDRQSE5SbnZF?=
 =?utf-8?B?V3pQRkQ5YXVrU2VIazBQOWx0TUg0TEFVbWNCWlRwUFdNTkVGZ1N0YWVUTVEz?=
 =?utf-8?B?ODJhTlh4c1ZaMU1IdHZ3clFocDdiSGt3ZGZaSTFJYnJGekZhTzhDUU9CWUM4?=
 =?utf-8?B?NDlYY0hRa1VlenZTNGpTWm9VdnlsUUVHelFNUHJOK1J5TmUvTWhIWitWcUh0?=
 =?utf-8?B?S2IwNVFCRXlnL2puTXM5YmM3NTZGTytFdmZMYitmS0pMWUtCVFdHUDZzNEdB?=
 =?utf-8?B?MjFQajdIVCtmK0lNQjlwTkpEM1IvNUNLR05JaThUUDN3MC9iRTBlQnJvdDkw?=
 =?utf-8?B?UExsMXhYbVV0RnZnd0dtVkZwSHJYTnFrbUg3MTBJakVGdmtsaVdpa1QwYXRO?=
 =?utf-8?B?RHZUVGd0dlo3RHRyejZCNXovTjhVMDErTytBclNUQWVzcXByeWFwd1VjRHda?=
 =?utf-8?B?SGJRQnFjRWdTNmpzanc5d3FCYWpOSml5ZzE4N2NwRHlGck40RUhRaGhCV3cw?=
 =?utf-8?B?OWg0Ync1b2RwV1ZiNDBjV1VXamwxNkVKd2FSWGVmdVdxeUJySzlDY084TzNu?=
 =?utf-8?B?YjNreEdqNHlSK1NqNzJ4QWVwOXY3UWorcjlHQ3RlKzRsQVBuZ05Xd05zdU1a?=
 =?utf-8?B?QmRiNGhNbkIrT2xPMGN3WTE2UjI0N1dOWEVFd0t6T0dFVmVmUTJ6YUtxdXZN?=
 =?utf-8?B?VkV6elNGbnM1Y0NtdG9Wa04vRk9MY0I5QnFkRVpxRE9JeS9mZlVMRTdQVlJC?=
 =?utf-8?B?SlRyT2plWHM5d0dlNmhkZVpvczltR2pZd3VQV0cwZTRrc25sdG1YU2dMSnZr?=
 =?utf-8?B?WjhqdHlyb1FRTkU3aFVMMGZpRHFBUWtNcnpjb09rc3J6U1RJbDFHY3NaYXo2?=
 =?utf-8?B?MjUySnBQWmttN0tVU254RGVseU51WWl4amRFU1pPUU15eUo4STJJbG5VREM5?=
 =?utf-8?B?SkhpR3VmR2tQbndjRHlBbUtlMWV5SGR4d3h5KytFdG1DaDQrM3plSXg1N2s1?=
 =?utf-8?B?VEhraVpOODJtRy9nMythMGp0Ulh6WjExdmZUd1JKNE1VVFB4ODBYSUhmRXRH?=
 =?utf-8?B?OUZPcXRKblhsUGpXeEZUQkxuQWV1bEVMbVowL0gzbTR0TFNjWXJmK2JBK1Uv?=
 =?utf-8?Q?blWI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da99fe3-f5d1-48a6-b24f-08d9fc20a39f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 07:45:36.3003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NXSKSDGK8OYTldHn3kLZ6GBBSwK88GZrH7ONN3HBKt3/aFcUf0S+k0vJr5wImkpe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6246
X-TM-SNTS-SMTP: 6B6FA3A585E8DDEBA91CE9C682810DC142E64C04E0A9D5B37E5E6EFAB5EFAA6D2000:8
X-OriginatorOrg: TCS.COM
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

SGkgSm9zZXBoLA0KDQpUaGFua3MgZm9yIGEgdmVyeSBjbGVhciBleHBsYW5hdGlvbi4gSSBhbSBt
b3JlIGludGVyZXN0ZWQgaW4gb3BlbkJNQyAgY3VzdG9taXphdGlvbiBsYXllcnMuIEFsc28sIHdv
dWxkIGFwcHJlY2lhdGUgc29tZSBpbmZvIHJlbGF0ZWQgdG8gcmVkZmlzaCBtb2R1bGVzLCBuZXcg
QVBJIGNyZWF0aW9uLCBldGMuICBNb3JlIGluZm9ybWF0aW9uIG9uIHRoaXMgd291bGQgaGVscCB1
cyBpbW1lbnNlbHkuDQoNClJlZ2FyZHMsDQpTYW5kZWVwLg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSm9zZXBoIFJleW5vbGRzIDxqcmV5QGxpbnV4LmlibS5jb20+IA0KU2Vu
dDogV2VkbmVzZGF5LCBNYXJjaCAyLCAyMDIyIDE6NDMgQU0NClRvOiBNaWtlIEpvbmVzIDxwcm9j
bGl2aXNAZ21haWwuY29tPjsgU2FuZGVlcCBLdW1hciA8c2FuZGVlcC5wa3VtYXJAdGNzLmNvbT4N
CkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBvcGVuQm1jIENvZGUg
U3RydWN0dXJlDQoNCiJFeHRlcm5hbCBlbWFpbC4gT3BlbiB3aXRoIENhdXRpb24iDQoNCk9uIDIv
MjUvMjIgNzozMSBBTSwgTWlrZSBKb25lcyB3cm90ZToNCj4gU2FuZGVlcCwgSSB0aGluayB0aGF0
IGlzIGxpa2UgYXNraW5nIHdoYXQgdGhlIHNvdXJjZSBjb2RlIHN0cnVjdHVyZSBvZiANCj4gYSBs
aW51eCBkaXN0cmlidXRpb24gaXMuIE9ibWMgaXMgYnVpbHQgZnJvbSBhIGxpbnV4IGtlcm5lbCBh
bmQgbWFueSANCj4gYXBwbGljYXRpb24sIGVhY2ggd2l0aCBpdOKAmXMgb3duIHN0cnVjdHVyZS4g
SeKAmW0gc3RpbGwgbGVhcm5pbmcgT0JNQyANCj4gbXlzZWxmLCBidXQgSSB3b3VsZCBsb29rIGF0
IHRoZSBvYm1jIFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydCBUaGlzIA0KPiBNZXNzYWdlIElzIEZy
b20gYW4gRXh0ZXJuYWwgU2VuZGVyIFRoaXMgbWVzc2FnZSBjYW1lIGZyb20gb3V0c2lkZSB5b3Vy
IA0KPiBvcmdhbml6YXRpb24uDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gU2FuZGVlcCwN
Cj4NCj4gSSB0aGluayB0aGF0IGlzIGxpa2UgYXNraW5nIHdoYXQgdGhlIHNvdXJjZSBjb2RlIHN0
cnVjdHVyZSBvZiBhIGxpbnV4IA0KPiBkaXN0cmlidXRpb24gaXMuIE9ibWMgaXMgYnVpbHQgZnJv
bSBhIGxpbnV4IGtlcm5lbCBhbmQgbWFueSANCj4gYXBwbGljYXRpb24sIGVhY2ggd2l0aCBpdOKA
mXMgb3duIHN0cnVjdHVyZS4NCj4NCj4gSeKAmW0gc3RpbGwgbGVhcm5pbmcgT0JNQyBteXNlbGYs
IGJ1dCBJIHdvdWxkIGxvb2sgYXQgdGhlIG9ibWMgZGVzaWduIA0KPiBkb2NzIGFuZCBsZWFybiBp
dHMgYXJjaGl0ZWN0dXJlLCB3aGljaCBpcyBiYXNpY2FsbHkgYSBkYnVzIHN5c3RlbSB3aXRoIA0K
PiBzZXJ2aWNlcywgYW5kIHRvIHRoZSBvdXRzaWRlIHdvcmxkLCBSZWRmaXNoLiBZb2N0byBpcyB0
aGUgZ2x1ZSB0aGF0IA0KPiBtYWtlcyBhIGNvbXBsZXRlIGltYWdlLg0KPg0KPiBNaWtlDQo+DQo+
PiBPbiBGZWIgMjQsIDIwMjIsIGF0IDExOjQyIFBNLCBTYW5kZWVwIEt1bWFyIDxzYW5kZWVwLnBr
dW1hckB0Y3MuY29tPg0KPj4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+PiBJIGhhdmUganVzdCBzdGFy
dGVkIGxvb2tpbmcgaW50byB0aGUgb3BlbkJtYyBzb3VyY2UgY29kZS4gQ291bGQgDQo+PiBhbnlv
bmUgZXhwbGFpbiB0aGUgc291cmNlIGNvZGUgc3RydWN0dXJlIGZvciBvcGVuQk1DPw0KDQpIZXJl
IGlzIGhvdyBJIGV4cGxhaW4gaXRzIG1vc3QgYmFzaWMgc3RydWN0dXJlOg0KT3BlbkJNQyBoYXMg
YSBjb21wbGV4IHNvdXJjZSBjb2RlIHN0cnVjdHVyZS7CoCBJdCB1c2VzIHRoZSBiaXRiYWtlIGJ1
aWxkIHN5c3RlbSB3aGljaCBydW5zIG9uIHlvdXIgYnVpbGQgaG9zdCBhbmQgcHJvY2Vzc2VzIHJl
Y2lwZXMgdG8gcHJvZHVjZSB0aGUgZmlybXdhcmUgaW1hZ2UuwqAgSW4gdGhpcyBzZW5zZSwgdGhl
IE9wZW5CTUMgc291cmNlIGNvZGUgY29uc2lzdHMgb2YgYSBzZXQgb2YgcmVjaXBlcy7CoCBBIHR5
cGljYWwgcmVjaXBlIHRlbGxzIGJpdGJha2UgdG8gZmV0Y2ggYSBwYWNrYWdlLCB1bnBhY2ssIHBh
dGNoLCBhbmQgY29uZmlndXJlIGl0LCBhbmQgYnVpbGQgaXQgaW50byB0aGUgZmlybXdhcmUgaW1h
Z2UuIEluIHRoaXMgc2Vuc2UsIHRoZSBPcGVuQk1DIHNvdXJjZSBjb2RlIGNvbnNpc3RzIG9mIHRo
ZSByZWNpcGVzIGFjdHVhbGx5IHVzZWQgdG9nZXRoZXIgd2l0aCB0aGUgcGFja2FnZXMgdGhleSBm
ZXRjaC7CoCBOYXR1cmFsbHksIHRoZSBleGFjdCBzb3VyY2UgY29kZSB1c2VkIGluIGFueSBnaXZl
biBidWlsZCBkZXBlbmRzIG9uIHdoaWNoIHZlcnNpb24geW91IGFyZSBidWlsZGluZyBmcm9tIChh
cyBkYWlseSBjaGFuZ2VzIGFyZSBtYWRlIHRvIHRoZSBtYXN0ZXIgYnJhbmNoKSBhbmQgd2hpY2gg
cGxhdGZvcm0geW91IGFyZSBidWlsZGluZyBmb3IuDQoqIFRoZSBkb3duc3RyZWFtIGZsb3cgZm9y
IHRoZSByZWNpcGVzIGlzOiBPcGVuRW1iZWRkZWQgLS0+IFlvY3RvL1Bva3kgDQotLT4gT3BlbkJN
QyAtLT4gSUJNIHByb2R1Y3QgZm9ya3MuwqAgKERldGFpbHMgZm9yIElCTSBwcm9kdWN0IGZvcmtz
IGFyZQ0KYmVsb3cuKcKgIEVhY2ggcHJvamVjdCBhbG9uZyB0aGUgc3RyZWFtIGN1c3RvbWl6ZXMg
dGhlIHJlY2lwZXMgYW5kIGFkZHMgbmV3IHJlY2lwZXMuDQoqIFRoZSBPcGVuRW1iZWRkZWQgKE9F
KSBwcm9qZWN0IGlzIHNlbWluYWwuwqAgSXQgcHJvdmlkZXMgdGhlIGJpdGJha2UgdG9vbCBhbmQg
cmVjaXBlcyBmb3IgbWFueSB0aG91c2FuZHMgb2Ygb3BlbiBzb3VyY2UgcHJvamVjdHMuDQoqIFRo
ZSBZb2N0by9Qb2t5IHByb2plY3QgaXMgZG93bnN0cmVhbSBmcm9tIE9FLsKgIEl0IG9yZ2FuaXpl
cyB0aGUgcmVjaXBlcyBpbnRvIGEgTGludXggZGlzdHJpYnV0aW9uIHN1aXRhYmxlIGZvciBlbWJl
ZGRlZCBzeXN0ZW1zLg0KKiBUaGUgT3BlbkJNQyBwcm9qZWN0IChodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy8pIGlzIGRvd25zdHJlYW0gZnJvbSBQb2t5LsKgIEl0IGFkZHMgQk1DJ3Mgc3BlY2lh
bGl6ZWQgZnVuY3Rpb25zIGluIGJpdGJha2UgbGF5ZXJzOg0KIMKgwqDCoCAtIG1ldGEtcGhvc3Bo
b3IgKGFuZCBvdGhlciBsYXllcnMpIC0gcHJvdmlkZSBjb21tb24vY29yZSBCTUMgZnVuY3Rpb24N
CiDCoMKgwqAgLSBtZXRhLW9wZW5wb3dlciAtIGFkZHMgc3VwcG9ydCBmb3IgT3BlblBPV0VSDQog
wqDCoMKgIC0gbWV0YS1pYm0gLSBhZGRzIHN1cHBvcnQgY29tbW9uIHRvIElCTSBzeXN0ZW1zDQog
wqDCoMKgIC0gbWV0YS13aXRoZXJzcG9vbiAoYXMgYW4gZXhhbXBsZSkgLSBhZGRzIHN1cHBvcnQg
Zm9yIHNwZWNpZmljIGhvc3QgbWFjaGluZXMNCg0KQXJlIHlvdSBtb3JlIGludGVyZXN0ZWQgaW4g
dGhlIFlvY3RvL2JpdGJha2Ugc3RydWN0dXJlLCBvciBpbnRlcmVzdGVkIGluIHRoZSBPcGVuQk1D
IGN1c3RvbWl6YXRpb24gbGF5ZXJzPw0KDQpKb3NlcGgNCg0KPj4gVGhhbmtzLA0KPj4gU2FuZGVl
cC4NCj4+DQo+PiA9PT09PS0tLS0tPT09PT0tLS0tLT09PT09DQo+PiBOb3RpY2U6IFRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSBhbmQvb3IgDQo+PiBhdHRh
Y2htZW50cyB0byBpdCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZv
cm1hdGlvbi4gDQo+PiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBhbnkg
ZGlzc2VtaW5hdGlvbiwgdXNlLCANCj4+IHJldmlldywgZGlzdHJpYnV0aW9uLCBwcmludGluZyBv
ciBjb3B5aW5nIG9mIHRoZSBpbmZvcm1hdGlvbiANCj4+IGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIGFuZC9vciBhdHRhY2htZW50cyB0byBpdCBhcmUgDQo+PiBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGNvbW11bmljYXRpb24gaW4gDQo+PiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB1cyBieSByZXBseSBlLW1haWwgb3IgdGVsZXBob25lIGFuZCBp
bW1lZGlhdGVseSANCj4+IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFu
eSBhdHRhY2htZW50cy4gVGhhbmsgeW91DQo+Pg0KPg0KDQo=

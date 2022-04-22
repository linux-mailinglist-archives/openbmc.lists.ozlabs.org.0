Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3974150EE94
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQQ00tz6z2yNF
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:12:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pYn0gsnp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::731;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=darren@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=pYn0gsnp; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlLSg2K7Qz2xy4
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 03:07:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8c9lvWahxIY+4Fo8RzvoVvlh+cnpjV/G8W0t6aGUDhOCeHTkJr/XDAXAok+d01IyZPd1713F98cmjKtqp7tQjBChBasDxBOjj/WnwPt387Agxw+/tyBp+sG8nGSt6cXU5FQjGHofAs2eBJ2wFsks0GuulkduoRJI176Tfm2hZYJV3nMXnfzEdjql6uoNA+vlKqTV0JP82B/ANmMcwfysBJAcz8A6qvcd2dIDsVRJbHItxYmFoqwsfDYMg4IKOWaDOb2ybfZhxQp/js3cC+JdHFKKbV+HDSh3h2jcgyYeuhFVyJKBEqlnkpkiYklpwGEKt8YYctPfqQqiFI5fWT6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlSbHQCIsuT8jbNKzD5u818C9g+4FJpQfh0QGNp/ZM0=;
 b=a9+XNfBZ7Y2ovyWPrC0Ym/Rl6/OELOaLu3mVEY/7bgb/2qmtqrjAvP1tTBrPaOVWgncKI7Vx5qfH1X0bdPHeNlCnPFMrC9PfKmcpttJbEN0EWmMYGwna9eEOZCmXIJ9CwVqGbi4kf0EUDnzndgDLkKunXYax2EHDgupJYQpqIOvXMuEpCuFRiegfnFzTaIEniwoZyZLW4ECmuQ0nea5HhNYTIyp9bIPQ4wEZHZd6a4QrAH/8Pr+jNOT7y8GHfaCAyxHeODK8ZxZUSVDKYjt7FXGALa9Es4OGX1ZSLxzv2BJHBelCI6auxIZma17blRJLxvcgy2Se5n4nYfh7QYOB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlSbHQCIsuT8jbNKzD5u818C9g+4FJpQfh0QGNp/ZM0=;
 b=pYn0gsnpQM1LIjYHVezDc9Gevm3lcXmj+6otLZN6M2fNYjCTk+S3ISOLbQHcuTUXjsTBrKLdHZ8TSdynplVywfNLNAG3f9fEdJJ0mqO8Y9s4D5WdL9DA8sXQOBp1N31dFzlfYn0rEOH/jVZ0wKTZO9sIvMGT5AxkIvGJeKhAj/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA0PR01MB6329.prod.exchangelabs.com (2603:10b6:806:ee::12) by
 BL0PR0102MB3554.prod.exchangelabs.com (2603:10b6:207:35::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Fri, 22 Apr 2022 17:07:19 +0000
Received: from SA0PR01MB6329.prod.exchangelabs.com
 ([fe80::ec31:ecc0:58a6:25b6]) by SA0PR01MB6329.prod.exchangelabs.com
 ([fe80::ec31:ecc0:58a6:25b6%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 17:07:18 +0000
Date: Fri, 22 Apr 2022 10:07:15 -0700
From: Darren Hart <darren@os.amperecomputing.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YmLgwwbVMFwViYBg@fedora>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
 <82a6452a-965b-7fbe-eba2-919f0a6ed73a@os.amperecomputing.com>
 <YmLCcFrrobUJtiLI@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmLCcFrrobUJtiLI@kroah.com>
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To SA0PR01MB6329.prod.exchangelabs.com
 (2603:10b6:806:ee::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a4d520-622a-49b1-6857-08da24828e23
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3554:EE_
X-Microsoft-Antispam-PRVS: <BL0PR0102MB355400857FF0FECF0A328C1DF7F79@BL0PR0102MB3554.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XAxJrcEqc7RBV0R/Ngq9tw90niSFz906d1YfHStAhdtuWXNuZwrxD1RPt0BODMRMJgSBnvywKGH/G/TQOpZVIWiEn2PdpUVVlYYG1F+bBG41aPbXtlR03ElgsOwef0LswoUQQg9o0MoqlkurIhNIhAeWmfeM9DoSZ8Tl5FauH2zSwUnslacg5UENtpyHWDevMmSVl5X2WM2uax2wegUVKeAf8fnfNBBjHwrWd8UzNYvWPp9HHlmqyQSo4EJ5aeZgrX4Pn2HzkqG/0gUFSVz0Lm02nd4e0Gz3rxlobv4Hj2e6Ms/TRFBiF28wPEEDA8nek9l3VXJ0FZJX740BsGb2DuhkwmOhicbKod/KA9aBawG7Uh+LOpnNWU3oN7H1zNt7uuK49BZ1G2x1XE+SfI0nN56bC/GYhZx3aO/ms0dgZA0D/QwlaIX8LGtEfvXKMUAAJblHYxPOwk7LkP9jOqWbNzZvYeRS4MryE4PXnCth1E9SbO0OKsfMd6Mie2+asrJBpphCrpIuwaY25M5SmkDXRhcAS979F4ePIeBWvzldmfYtYah5L1hS6UyA80r+OYoCbibdNjL7JgFzWc/d9aCS3UQ+n7GpOxbItZht/51XyzCJ3/8Elw6N/wNtJ479WXqV0JWCC+bu1aW0dVwv8LCyubVV3VeYNSSOM+TQWdoddqPFnExLd3Y/aNz3rtoltR6qHGQkHpNDug6XAlHszi+9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR01MB6329.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(53546011)(86362001)(52116002)(8676002)(5660300002)(38350700002)(7416002)(8936002)(4326008)(33716001)(316002)(54906003)(6486002)(508600001)(66476007)(6916009)(66556008)(66946007)(186003)(6666004)(6512007)(107886003)(26005)(9686003)(6506007)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?orwUsD8QBylfjPADMjmkiW5Rf7uecyN1zow4hvMn5AviB2bC4lzC71K7Ki5K?=
 =?us-ascii?Q?LrHVvn3Dlb2PV5hKS2uWy1S9r2aaYZzoev3cNnaRkePRY24hDmAoZQv8gJXF?=
 =?us-ascii?Q?VHehHUS3yzcEX3lxVW8T4HSqREorJ1SZ59IUEXWVGqhlzgZWB2ulPUN5jzp7?=
 =?us-ascii?Q?uhz4IxMNOEZWUttpBoTdciv5CMH5R4qdlAGv+lxkNcPhX3KWonQcpqjfQVKU?=
 =?us-ascii?Q?UBEBO/spGgcomK8mHsigKKzt+FH4daUDTs/nVUe41QIGncChFzAj1xZbwO5O?=
 =?us-ascii?Q?w2lqgCgsVhIh9huRVifkO8UhecQiiqHblGV+7zyccUNGiAs0IkGo4k0+Vy/g?=
 =?us-ascii?Q?wlzemAbh/3S2lHy9mvMcdYerLfRzlVM8Bnp53A7m5HBHoorrfsvYtRQ8fch3?=
 =?us-ascii?Q?En0YWZsVDEhv38+OlbTqQig3qBATLO4XDl6GStZVdhNfTScfsBQWSSanccov?=
 =?us-ascii?Q?PQngXxKenKSdfvv5xF3FlahrtGTpfm/9afMZBCH7948075GWhmvppRx2MyiK?=
 =?us-ascii?Q?N5IQW6D/qh3HT2BaQE3rang5++gO59kaZjnWnWmHHzcT2UCd27377F6ZXwSo?=
 =?us-ascii?Q?SZGhJHUDnkVnmYK5gpSm5v7bXPVaa2LdRkng1ukgJZ4P1A30xg9jvj/cT2NL?=
 =?us-ascii?Q?PXegKv9eHm27fTC1oeMMAEumwFc2uRDZeQKEutsIC4MGhe6PIwj2sHFqb3h3?=
 =?us-ascii?Q?TICdr5r4l3nPia7UEvZUvdeVwjTmuApYwogpAUcW3Fe2j8AQR+TXLRMbraMv?=
 =?us-ascii?Q?X2mVv7dJZmda0gi37+Rgj5BOQLbOdHLOKbDwdfCGRFhi5ikF5fuz84XC5/Jp?=
 =?us-ascii?Q?KSjHHCLqqPhJ5NQ+m3V5/tM4End/oCLrrkH5Klk1PTwxsrvLgHJivz4n+8dW?=
 =?us-ascii?Q?U5WGlk1+bnkFMTzyMM2ZH6Fz6sMzTZp2FopzwsdJNzMFIUkiDcQaDToxrFxA?=
 =?us-ascii?Q?zhSFEMyGUS/7wAwkzCm+8QHwzG/w+lQayvfnBKUY++ZhrKyoX3A4eI1E0vqe?=
 =?us-ascii?Q?VJwkVsyc3tN9mVOxsU7hA00vP5cI6GRM337Hoo4kXpFns3w7HI/S1yOSf7xH?=
 =?us-ascii?Q?HDuQ9gs71m9kxrql3LNOdmlSZ/jtZAGIhK77PAyR0WZZHBV8URaCXroU+7Oo?=
 =?us-ascii?Q?HAztGDwzUsfdeywcceCBD0IHNZqDvq3G2ZEdyaPz/axZvIHGziWMPY3IkBZJ?=
 =?us-ascii?Q?mlNuy7Ndyi9eBYNsiWUegzGnsYKdSqEIxrw5OO4VaoIXABxQuHeo0zopy6i2?=
 =?us-ascii?Q?vQFKSN0vDX40AZAqmJ+zkSXxn3FHd58BfbhiMw8L6ahJzdzbKU+XfM5/sYjn?=
 =?us-ascii?Q?mR/Jk1YZWb4XFS8wUzOUEZnUvUngXe5RmBwT4dmXfeOV363CZTZPrtb3fQgq?=
 =?us-ascii?Q?UDfEwb7oLkkEtzBv+Sl1rcO41JPDXoRM7xHEuEto3PDJBjfKteoAg2iW5WRS?=
 =?us-ascii?Q?iAVyk2hmAQXD0iizRXPTy2UDAj7lWcWgy3u3pIRdpeqXH32uFbYiiDKG7cz/?=
 =?us-ascii?Q?T9u8isMZj+w5AOdEvn6nwtWQvQA1p7LJ+BuQzir2cbLaYmqIxVsjhHOFW0lo?=
 =?us-ascii?Q?rBsPnDiGNEBkDOdsbHubcyFpbIAirKqdY7UNoh51Vv+bDbWKYjUn7P76Tio6?=
 =?us-ascii?Q?OpXHMWRe2DL6Qr0mnZ7msRR0eUBvxgy+4wOY8kJ2gXyuKgx5F9mplBUMVioe?=
 =?us-ascii?Q?7b0vyj00TQO1LE+70Y52vYsNb4ZVhhECZg4jUYSmSe4orHF1+hgj9WfirDSj?=
 =?us-ascii?Q?R/2Gjgjcm6TkS2pNfXViCDesXm7/k28Rsw3ZFHMJa7ixzR5TdTm9?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4d520-622a-49b1-6857-08da24828e23
X-MS-Exchange-CrossTenant-AuthSource: SA0PR01MB6329.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 17:07:18.7084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78REwfForVMq4WUovvJ9QPlDLL2SP8YBA3rmmQcj+pJZ0n6bVQkhhIaWoXjUzyA8mUYhbCsu1UeGcOANfXs0GgvZ2D7ypPN0kxX0Z38lik2LM0pposKAkyyhhhD0C82h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3554
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:09 +1000
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 04:57:52PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 22, 2022 at 09:43:39PM +0700, Quan Nguyen wrote:
> > On 22/04/2022 13:20, Greg Kroah-Hartman wrote:
> > > On Fri, Apr 22, 2022 at 09:46:47AM +0700, Quan Nguyen wrote:
> > > > This commit adds Ampere's SMpro error monitor driver for monitoring
> > > > and reporting RAS-related errors as reported by SMpro co-processor
> > > > found on Ampere's Altra processor family.
> > > > 
> > > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > > ---
> > > > Changes in v8:
> > > >    + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
> > > >    + Avoid uninitialized variable use               [kernel test robot]
> > > >    + Switch to use sysfs_emit()                                  [Greg]
> > > >    + Make sysfs to return single value                           [Greg]
> > > >    + Change errors_* sysfs to error_*                            [Quan]
> > > >    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
> > > >    overflow status of each type of HW errors                     [Quan]
> > > >    + Add some minor refactor                                     [Quan]
> > > > 
> > > > Changes in v7:
> > > >    + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
> > > >    + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
> > > >    + Validate number of errors before read                       [Quan]
> > > >    + Fix wrong return type of *_show() function     [kernel test robot]
> > > >    + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
> > > >    + Use pointer instead of stack memory                         [Quan]
> > > > 
> > > > Changes in v6:
> > > >    + First introduced in v6 [Quan]
> > > > 
> > > >   drivers/misc/Kconfig        |  12 +
> > > >   drivers/misc/Makefile       |   1 +
> > > >   drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
> > > >   3 files changed, 490 insertions(+)
> > > >   create mode 100644 drivers/misc/smpro-errmon.c
> > > > 
> > > > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > > > index 41d2bb0ae23a..9fbe6797c440 100644
> > > > --- a/drivers/misc/Kconfig
> > > > +++ b/drivers/misc/Kconfig
> > > > @@ -176,6 +176,18 @@ config SGI_XP
> > > >   	  this feature will allow for direct communication between SSIs
> > > >   	  based on a network adapter and DMA messaging.
> > > > +config SMPRO_ERRMON
> > > > +	tristate "Ampere Computing SMPro error monitor driver"
> > > > +	depends on MFD_SMPRO || COMPILE_TEST
> > > > +	help
> > > > +	  Say Y here to get support for the SMpro error monitor function
> > > > +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
> > > > +	  loading, the driver creates sysfs files which can be use to gather
> > > > +	  multiple HW error data reported via read and write system calls.
> > > > +
> > > > +	  To compile this driver as a module, say M here. The driver will be
> > > > +	  called smpro-errmon.
> > > > +
> > > >   config CS5535_MFGPT
> > > >   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
> > > >   	depends on MFD_CS5535
> > > > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > > > index 70e800e9127f..483308a6e113 100644
> > > > --- a/drivers/misc/Makefile
> > > > +++ b/drivers/misc/Makefile
> > > > @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
> > > >   obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
> > > >   obj-$(CONFIG_SGI_XP)		+= sgi-xp/
> > > >   obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
> > > > +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
> > > >   obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
> > > >   obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
> > > >   obj-$(CONFIG_HP_ILO)		+= hpilo.o
> > > > diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
> > > > new file mode 100644
> > > > index 000000000000..df7d8fc4ff3f
> > > > --- /dev/null
> > > > +++ b/drivers/misc/smpro-errmon.c
> > > > @@ -0,0 +1,477 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > 
> > > Are you sure you mean "or any later version"?  I have to ask.
> > > 
> > 
> > Thank Greg for the review.
> > 
> > Will change all to SPDX-License-Identifier: GPL-2.0-or-later in next
> > version.
> 
> That is not what I am asking (the SPDX tag format).  I mean, do you
> really mean "or later" for your license as that is not the license of
> the kernel overall?  If so, wonderful, but I have to ask that as your
> legal group needs to be aware of it, sorry.

Generally speaking we should be sticking with the standard license for projects
we engage with, in this case "GPL-2.0".

Quan, unless you have heard differently or have a specific reason to include the
"+", please drop from the next version. If you do feel the "+" is required,
let's have an internal conversation about that.

Apologies for missing that in earlier reviews.

Thanks,

-- 
Darren Hart
Ampere Computing / OS and Kernel

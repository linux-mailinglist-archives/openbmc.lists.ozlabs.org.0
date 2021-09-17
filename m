Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E140F96F
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 15:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9w8M1X1kz2xXn
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 23:41:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=2RL0mbp/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.212.115;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=2RL0mbp/; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2115.outbound.protection.outlook.com [40.107.212.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9w7r1PP4z2xtr
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 23:40:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWHWNo+FWsvodyMFZz3OC4SKoGpOMNYpQfcMTiRMAkiNexu4f13Dk4mp85i/pHmNY5gEoheLN9MaUtBZchX6aPBzEyKZkgCyVLrQDD74gtjlmlCdLkqPbr/DNQ19W/ekr/3Irxk4N89NDA1NACVXYxFPJrk2Dm5doVpxlITInmPAmJpaDndeAdHjtxZ5eivFQqCKsLAjazS6Yx7n3tZsouqQj7FrQn62spNYchHznJseWgilWBAeYhMdWnBMwMgfTC2YU7G1zJ4Ngcw9Ys46Giagznhbi06m3gpy0CFkHHNS6shbDXrKVPKrCBU3V5JY0kRuq+zF5P4g3iUdVQ2pPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tAZalgHu2Lb1jHTTDSY1AP4q97kdEvLu90Q2h9nvaBc=;
 b=CfqM/Y58Pjdk8n0v8vy7eAPfGBVoWaModWD0B2xtuJ6bDJqL44+mKJGcsf6ZpnGMRPi8aqgERTPYRQRZAC3H47n8HhZWnohF1hjJ6LBFVG/76qbRTuhrO7ZfKyLPTIG4Nsfr6eHd/GfnNGZDRBnHXAmDIRgd6WcugpXShRR8xHL9QkxTSlcRt4KlWiucdQWG02iINDk3VU1fTBn8Vv2kF8se0TvMLR+bXHMagJBb5WUAn2BOP32JpucwJoOu1lj9FrDXZu7leVTEnBdo/WI+ZDBExHa1AmOyZkSynP7Em4MlcqzAmP4WQf+suntO0GLvjGCYHkpUj2gk9RmAy84elA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAZalgHu2Lb1jHTTDSY1AP4q97kdEvLu90Q2h9nvaBc=;
 b=2RL0mbp/rjRrJTVdKe5aMFJgDzJHfIGMp7JYbh6j0icFVAXHZcWuYJsAzQ+G0j5pTUYOR2nznsd4wvG8NCMTwoPFbZlWOm0QrvgKNHL4Yzfg7oNEBg+JrNG4b0h0vRKwfY92sgUYt3eoeIBZxfWzN5cDWcGXylujIUrNPxHyAN0=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4440.prod.exchangelabs.com (2603:10b6:a03:a0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 13:40:16 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc%6]) with mapi id 15.20.4478.026; Fri, 17 Sep 2021
 13:40:16 +0000
Subject: Re: Read smbios2 file failed
To: Jie Yang <jjy@google.com>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
Date: Fri, 17 Sep 2021 20:40:03 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------57DBF0C4262A75DF3E1AA120"
Content-Language: en-US
X-ClientProxiedBy: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from hcm-fvfx4014hv2j.lan (42.116.120.79) by
 HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 13:40:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986e5422-7730-434d-4dcb-08d979e0aea0
X-MS-TrafficTypeDiagnostic: BYAPR01MB4440:
X-Microsoft-Antispam-PRVS: <BYAPR01MB44407E8D31EBA2D75C7616FE8DDD9@BYAPR01MB4440.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cza1fUK+4UFwpjkN+tyjSydiKkex/lq4IEWmAJebNHae2W7zdagkZ78IYflUQMMHRwKCeE+sCJq20nUbwXbYTKutDLsuILfR6rrAlb/UsVNnI1flvEfiArPUbe3ea3wgHkEkMPaWjguT0+S4d15GU73HEFqv6yyZcp1UyBTRmiQLLIFbotVYIJdID7h7ubqfA2s05jUXnAXIsHGQ51uhfDTIbii8Pi2YCZGYpxhFp2qs4an9FqDJtgK8o/pnsbRhJSIG5KQ2SmKFiFuZXqa5RQNxXcxSv7xGNdtz8WIQr/yhBVpL6jn3rhdEO/HpiY7fRiApVcSZiguVd7zTm2lfn7EXeVzqUV6Si9zgFPWSE/oGxVY3CAZ4LU8DgpA3+uqZ1Ngzy8ZHaRvqdxEoRD447UxEZ95F0f6lG+81jEWKLM5JSf6xaM7daUSbOB4sB2d2fi0z4Fg8i90260ocOUgVP0k9W0DDj5SDImnqrTmI2JDrC8HG4TiI+1B1a279fwsrcOp3SVf0XnDXU8IZa5vuLkYWn4v876ARt5OS6H0Qs3qnLtheeJIk8nyV56dDOT/m/dz1JGv7Q02lYe2C+aM69bic7YaR3vt2C18RF7It3PSJSQiw1msQb99wyReETCZw2pH4DeIE+zmWAFU4RZ4nCWfF8WXm3iqviL7G3hExGuypFqq2B1SsR7KZQJk+EVd63C3980Kv7QibWNbe0u+UtO29BvxQcTb0jxWmGgl6TiX/tDg/jjTmsHgE8xJZ1/biqV9g79gdkpshJloJKtzErOQrmXzXaeygMM88BWF2YVzeUW2ED30WaqaIKI1IYtqohUFlzUStPPqLGoGAzfsAFn2cGPAuZ1d79q3DbtYYGAyS3pw74tZ1ckw3aP8o2seG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(83380400001)(186003)(5660300002)(66476007)(66556008)(66946007)(38350700002)(2906002)(956004)(42882007)(38100700002)(52116002)(6512007)(478600001)(966005)(33964004)(6486002)(8936002)(2616005)(31696002)(6506007)(54906003)(6666004)(31686004)(83170400001)(53546011)(30864003)(8886007)(316002)(26005)(6916009)(8676002)(166002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUFIemRrWHM4RTFiOW0vOU9nVEliTVpZMmFWcXdITDh5cm5ocFAxMmFUc056?=
 =?utf-8?B?WnB6NmFRTlUwM1FRT3Fua0kzRGVwSW1uektEUjlmbUJlVlBReHRiUS93Z25V?=
 =?utf-8?B?aXI0bkpDVkNDMzJLYkY2bGJxazlSNThLRVMwaHovSHI2dHI4Y3hxd0o5Z1pK?=
 =?utf-8?B?RFJ1LzZOTzkwK09sOEtpMXNtOWo1ZlcyS0pzTHo5dW5kbWl1ZTMxTWcxZStm?=
 =?utf-8?B?VFAveURCY3BOelkzMjVhNHVJUmRGTUpZT20yclh0VGQrMi90cVdqNFZUUVR6?=
 =?utf-8?B?b2hlSW5PVngvdFdmSWdiamtUOXhUUzRzbldYY0ZQb2NkKzVEOXdwUnNmTU0x?=
 =?utf-8?B?aHlVRFR5VGpkNzJzY0lDbk5ObE9DYndDREZJU2VhMDR2TmcvVjNmTEFIdXFE?=
 =?utf-8?B?YlNBNFBPUnNaQkpMaGZxbkVNL2JwYm9aODVhNzVxdTJhRHpNTVVuZTlIUkJY?=
 =?utf-8?B?RWFrNTVIK2tOelA2SEdVenZaeWU1Qmh6MTJiemF3VzgycmVEQ2FvM0ZpcTN6?=
 =?utf-8?B?eXhZR3ZqTXNxbStqOFdGSnVsUFd0ZC92alh2bkQvYklXSmVaL0xtVTM3enJX?=
 =?utf-8?B?aFRZYTFwM0liQjhYMnErOG02VWF5V29WUkdaUmRUVm9lTG8rMjlwQ2hwVFU2?=
 =?utf-8?B?UjdLcW5jNXRPcHgvcDNFbno4RXptMklRNWlxTXo4MDN6bzR3R0dqZFNjTm1Y?=
 =?utf-8?B?Z2poUjhYQUxtdUZpS2JqUzFxZCtuVHd2WkRUSzVTcHFwNUl4R3hFY3VEVDNJ?=
 =?utf-8?B?QkpQK1ZUTUZvUkszSmxhQzJLUU5qN0N1cDBpZkFCUjM3SjNXUVp4ZVhkQXNG?=
 =?utf-8?B?Y3lkT3dvdnRXZ0FoVzYvNXdXKytDNCtnbUtLV1VjWk1qUHFURm9jMzIrODJP?=
 =?utf-8?B?RU1YeGNJek1VMTRiN3h6c1Y0ekZzOVJhczdvamMrOEljaUtDRXBrSWtlTGZK?=
 =?utf-8?B?NGhNa1hmNTVRdERVQUNWZnFxekp5VHQ0OWE2L0JIUVI4Z1FZMFZtZmt1dzV1?=
 =?utf-8?B?STZrb0ZTNU9BUVd3d29PMW1TeVRXUkx5dk9DMEhacUdmRkNORmR0TndxL1A5?=
 =?utf-8?B?dFVYNHhIeTBBMUFsNVJEeWVkUmRUMzQ2cnZvdVdHMER6eFBFK1NmdHhvMG5C?=
 =?utf-8?B?UkMyWGRTY2ZzZjlURkg2UnE3MXBKNFUzdlY2ZWpJTFZNK3JBT3dBdCtuYjE0?=
 =?utf-8?B?enRydld3Tm9wZk8rWk5ZaWZNRE02ZUpNTjlBdUxJS1pRWG9YSzVabklvN0p1?=
 =?utf-8?B?VERrMTJOcVRnb3oxYmRDRmxrNnRybW5hMk0wSnJSWExNcU5TN2w2YjNIS3ZD?=
 =?utf-8?B?YVdFdGFyRUpXbEJlNUlYVTZEaTlKcjI5SElEcFh3UXU2VFpDQVpIdDQ4R1VV?=
 =?utf-8?B?MWhJMmcvTWtkb1lwT1hGS1BOekZjdlpVclNzS3JlQW1hMkkwNFJ2LzF2b2Y1?=
 =?utf-8?B?anlCcUNGTlpyY2p4dFZNaE9UbnVRTGhIU0dZekd4c1JxN00yM0I1cnpTVjZm?=
 =?utf-8?B?aVJacUczcWp5RHBWblF0dlFjNWRTcEdzdG1FUXpaMGkyT2Nwc25KaUs5NEVh?=
 =?utf-8?B?ejdLdnB2WEdwMXF2YkhYc1ZJcllSa28wQ01CZlBDN3R4RW9HbzhyVXYwOTFy?=
 =?utf-8?B?a2pJT1hPZVgvRXFGOEROYUdGRGVXenVGTEtPVVpqY3BpUm0vUEtLUjZvdEFB?=
 =?utf-8?B?MlRoZGRCbXRhVnRXWFFqOTJ6RmkyaVM3RncrTXpPeG04T3lkTVJLL2lDMHFm?=
 =?utf-8?Q?vkl0exWQT2qoqwa0q1pgOM2ioigpXWBGqnEa5Xp?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986e5422-7730-434d-4dcb-08d979e0aea0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:40:16.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiTfbxuwJGsZmDmqed8E0SbgQmjZnnYefu9OS4hfZPmImWF9P6N67vYhpR5FZgwgWNb2QSblh8R0AcGmcLLpCpt7HciA1RNkofW5JA2SXVSSrfQD99zTLjOf6jh6crAU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4440
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 Andrei Kartashev <a.kartashev@yadro.com>, CS20 CHLi30 <chli30@nuvoton.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------57DBF0C4262A75DF3E1AA120
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Jia for your information

On 17/09/2021 05:36, Jie Yang wrote:
> Hi,
>
> Actually I added an ipmi blob interface to 
> smbios-mdr https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs 
> <https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs>. 
> With this interface you can send the smbios tables to BMC either 
> through LinuxBoot or host. The LinuxBoot code 
> https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer 
> <https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer>. 
> Writing and committing to this blob will generate the MDR header.
>
> -Jie
>
> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen 
> <thang@amperemail.onmicrosoft.com 
> <mailto:thang@amperemail.onmicrosoft.com>> wrote:
>
>     Thanks Tim, Mike and Andrei for very useful information. We can
>     make it
>     work by adding MDRv2 header.
>
>     I am finding some information about the IPMI blobs commands. I can
>     see
>     some notes at
>
>     https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md
>     <https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md>
>
>     https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md
>     <https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md>
>
>     But I have not found more description about the IPMI blob commands
>     like
>     NetFn, Func, ... that I can send a file from Host to BMC. Do you have
>     any information about them?
>
>
>     Thanks,
>
>     Thang Q. Nguyen
>
>     On 16/09/2021 09:40, CS20 CHLi30 wrote:
>     > Hi Thang,
>     > Did you try to use smbios_entry_point or DMI from host to BMC
>     /var/lib/smbios/smbios2 for parsing?
>     >
>     > You can refer this sysfs-firmware-dmi-tables as below:
>     >
>     > The firmware provides DMI structures as a packed list of data
>     referenced by a SMBIOS table entry point.
>     > The SMBIOS entry point contains general information, like SMBIOS
>     version, DMI table size, etc.
>     > The structure, content and size of SMBIOS entry point is
>     dependent on SMBIOS version.
>     >
>     > The format of SMBIOS entry point and DMI structures can be read
>     in SMBIOS specification.
>     > The dmi/tables provides raw SMBIOS entry point and DMI tables
>     through sysfs as an alternative to utilities reading them from
>     /dev/mem.
>     >
>     > The raw SMBIOS entry point and DMI table are presented as binary
>     attributes and are accessible via:
>     > /sys/firmware/dmi/tables/smbios_entry_point
>     > /sys/firmware/dmi/tables/DMI
>     >
>     > Best regards,
>     > Tim
>     >
>     > -----Original Message-----
>     > From: openbmc [mailto:openbmc-bounces+chli30
>     <mailto:openbmc-bounces%2Bchli30>=nuvoton.com@lists.ozlabs.org
>     <mailto:nuvoton.com@lists.ozlabs.org>] On Behalf Of Garrett, Mike
>     (HPE Server Firmware)
>     > Sent: Wednesday, September 15, 2021 9:19 PM
>     > To: Andrei Kartashev <a.kartashev@yadro.com
>     <mailto:a.kartashev@yadro.com>>; Thang Nguyen
>     <thang@amperemail.onmicrosoft.com
>     <mailto:thang@amperemail.onmicrosoft.com>>; openbmc
>     <openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>
>     > Subject: RE: Read smbios2 file failed
>     >
>     > We recently did the same thing and got it working.  All you have
>     to do is take the RAW smbios records blob in binary form
>     (delivered as noted below in whatever way you choose) and prepend
>     a specific header:
>     https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;data=04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=0
>     <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;data=04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=0>
>     >
>     > It is a little bit fragile as it introduces a dependency on the
>     file download logic to write a non-standard header defined in
>     another service that could potentially change.
>     >
>     > Mike
>     >
>     >> -----Original Message-----
>     >> From: openbmc <openbmc-
>     >> bounces+mike.garrett=hpe.com@lists.ozlabs.org
>     <mailto:hpe.com@lists.ozlabs.org>> On Behalf Of Andrei
>     >> Kartashev
>     >> Sent: Wednesday, September 15, 2021 3:17 AM
>     >> To: Thang Nguyen <thang@amperemail.onmicrosoft.com
>     <mailto:thang@amperemail.onmicrosoft.com>>; openbmc
>     >> <openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>
>     >> Subject: Re: Read smbios2 file failed
>     >>
>     >> I don't know what is format of "dmidecode --dump-bin", but if
>     it just
>     >> raw dump of smbios then you only need to add mdr header.
>     >>
>     >> See answer for the same question here:
>     >> INVALID URI REMOVED
>     >> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
>     >> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
>     >>
>     >> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
>     >>> Hi Andrei,
>     >>>
>     >>> I see output of "dmidecode --dump-bin" follows SMBIOS
>     specification.
>     >>> As
>     >>> the data for smbios-mdr does not follow this, do you know
>     about the
>     >>> document or any information I can reference to prepare data to
>     send
>     >>> to BMC??
>     >>>
>     >>>
>     >>> Best Regards,
>     >>>
>     >>> Thang Q. Nguyen
>     >>>
>     >>> On 14/09/2021 15:51, Andrei Kartashev wrote:
>     >>>> No, it is not same as "dmidecode --dump-bin".
>     >>>>
>     >>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
>     >>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
>     >>>>>> You need to somehow deliver smbios data image to BMC. This
>     >>>>>> means, your BIOS should implementat some logic to transfer
>     >>>>>> this data.
>     >>>>>> For BMC side see example here:
>     >>>>>>
>     https://apc01.safelinks.protection.outlook.com/?url=https%3A%2
>     <https://apc01.safelinks.protection.outlook.com/?url=https%3A%2>
>     >>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=04%7C01%7Cchli
>     >>>>>> 30%40nuvoton.com
>     <http://40nuvoton.com>%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
>     >>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
>     >>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>     >>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cG6ZZzOSXkuUtcQuuoymsRdP
>     >>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=0
>     >> oem/blob/master/src/smbios
>     >>>>>> mdrv2handler.cpp
>     >>>>> Hi Andrei,
>     >>>>>
>     >>>>> What is the format of smbios data to transfer to BMC? Is it the
>     >>>>> same content of "dmidecode --dump-bin" command from Host Linux?
>     >> or
>     >>>>> anything special in formatting the content to send?
>     >>>>>
>     >>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>     >>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
>     >>>>>>> smbios-mdr repository and I have error:
>     >>>>>>>
>     >>>>>>> Read data from flash error - Open MDRV2 table file failure
>     >>>>>>>
>     >>>>>>> There isnt file in /var/lib/smbios/smbios2
>     >>>>>>>
>     >>>>>>> How I can resolve this problem?
>     >>>>>>> Help me please!!!
>     >>
>     >> --
>     >> Best regards,
>     >> Andrei Kartashev
>     >>
>     > ________________________________
>     > ________________________________
>     >   The privileged confidential information contained in this
>     email is intended for use only by the addressees as indicated by
>     the original sender of this email. If you are not the addressee
>     indicated in this email or are not responsible for delivery of the
>     email to such a person, please kindly reply to the sender
>     indicating this fact and delete all copies of it from your
>     computer and network server immediately. Your cooperation is
>     highly appreciated. It is advised that any unauthorized use of
>     confidential information of Nuvoton is strictly prohibited; and
>     any information in this email irrelevant to the official business
>     of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
>

--------------57DBF0C4262A75DF3E1AA120
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Thanks Jia for your information<br>
    </p>
    <div class="moz-cite-prefix">On 17/09/2021 05:36, Jie Yang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com">
      
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>Actually I added an ipmi blob interface to smbios-mdr<a href="https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs" moz-do-not-send="true">&nbsp;https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs</a>.
          With this interface you can send the smbios tables to BMC
          either through LinuxBoot or host. The LinuxBoot code&nbsp;<a href="https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer" moz-do-not-send="true">https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer</a>.
          Writing and committing to this blob will generate the MDR
          header.</div>
        <div><br>
        </div>
        <div>-Jie</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Sep 16, 2021 at 4:19
          AM Thang Nguyen &lt;<a href="mailto:thang@amperemail.onmicrosoft.com" moz-do-not-send="true">thang@amperemail.onmicrosoft.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks
          Tim, Mike and Andrei for very useful information. We can make
          it <br>
          work by adding MDRv2 header.<br>
          <br>
          I am finding some information about the IPMI blobs commands. I
          can see <br>
          some notes at<br>
          <br>
          <a href="https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md</a><br>
          <br>
          <a href="https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md</a><br>
          <br>
          But I have not found more description about the IPMI blob
          commands like <br>
          NetFn, Func, ... that I can send a file from Host to BMC. Do
          you have <br>
          any information about them?<br>
          <br>
          <br>
          Thanks,<br>
          <br>
          Thang Q. Nguyen<br>
          <br>
          On 16/09/2021 09:40, CS20 CHLi30 wrote:<br>
          &gt; Hi Thang,<br>
          &gt; Did you try to use smbios_entry_point or DMI from host to
          BMC /var/lib/smbios/smbios2 for parsing?<br>
          &gt;<br>
          &gt; You can refer this sysfs-firmware-dmi-tables as below:<br>
          &gt;<br>
          &gt; The firmware provides DMI structures as a packed list of
          data referenced by a SMBIOS table entry point.<br>
          &gt; The SMBIOS entry point contains general information, like
          SMBIOS version, DMI table size, etc.<br>
          &gt; The structure, content and size of SMBIOS entry point is
          dependent on SMBIOS version.<br>
          &gt;<br>
          &gt; The format of SMBIOS entry point and DMI structures can
          be read in SMBIOS specification.<br>
          &gt; The dmi/tables provides raw SMBIOS entry point and DMI
          tables through sysfs as an alternative to utilities reading
          them from /dev/mem.<br>
          &gt;<br>
          &gt; The raw SMBIOS entry point and DMI table are presented as
          binary attributes and are accessible via:<br>
          &gt; /sys/firmware/dmi/tables/smbios_entry_point<br>
          &gt; /sys/firmware/dmi/tables/DMI<br>
          &gt;<br>
          &gt; Best regards,<br>
          &gt; Tim<br>
          &gt;<br>
          &gt; -----Original Message-----<br>
          &gt; From: openbmc [mailto:<a href="mailto:openbmc-bounces%2Bchli30" target="_blank" moz-do-not-send="true">openbmc-bounces+chli30</a>=<a href="mailto:nuvoton.com@lists.ozlabs.org" target="_blank" moz-do-not-send="true">nuvoton.com@lists.ozlabs.org</a>] On
          Behalf Of Garrett, Mike (HPE Server Firmware)<br>
          &gt; Sent: Wednesday, September 15, 2021 9:19 PM<br>
          &gt; To: Andrei Kartashev &lt;<a href="mailto:a.kartashev@yadro.com" target="_blank" moz-do-not-send="true">a.kartashev@yadro.com</a>&gt;; Thang
          Nguyen &lt;<a href="mailto:thang@amperemail.onmicrosoft.com" target="_blank" moz-do-not-send="true">thang@amperemail.onmicrosoft.com</a>&gt;;
          openbmc &lt;<a href="mailto:openbmc@lists.ozlabs.org" target="_blank" moz-do-not-send="true">openbmc@lists.ozlabs.org</a>&gt;<br>
          &gt; Subject: RE: Read smbios2 file failed<br>
          &gt;<br>
          &gt; We recently did the same thing and got it working.&nbsp; All
          you have to do is take the RAW smbios records blob in binary
          form (delivered as noted below in whatever way you choose) and
          prepend a specific header:&nbsp; <a href="https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;amp;data=04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=0" rel="noreferrer" target="_blank" moz-do-not-send="true">https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;amp;data=04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
 iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=0</a><br>
          &gt;<br>
          &gt; It is a little bit fragile as it introduces a dependency
          on the file download logic to write a non-standard header
          defined in another service that could potentially change.<br>
          &gt;<br>
          &gt; Mike<br>
          &gt;<br>
          &gt;&gt; -----Original Message-----<br>
          &gt;&gt; From: openbmc &lt;openbmc-<br>
          &gt;&gt; bounces+mike.garrett=<a href="mailto:hpe.com@lists.ozlabs.org" target="_blank" moz-do-not-send="true">hpe.com@lists.ozlabs.org</a>&gt; On
          Behalf Of Andrei<br>
          &gt;&gt; Kartashev<br>
          &gt;&gt; Sent: Wednesday, September 15, 2021 3:17 AM<br>
          &gt;&gt; To: Thang Nguyen &lt;<a href="mailto:thang@amperemail.onmicrosoft.com" target="_blank" moz-do-not-send="true">thang@amperemail.onmicrosoft.com</a>&gt;;
          openbmc<br>
          &gt;&gt; &lt;<a href="mailto:openbmc@lists.ozlabs.org" target="_blank" moz-do-not-send="true">openbmc@lists.ozlabs.org</a>&gt;<br>
          &gt;&gt; Subject: Re: Read smbios2 file failed<br>
          &gt;&gt;<br>
          &gt;&gt; I don't know what is format of &quot;dmidecode
          --dump-bin&quot;, but if it just<br>
          &gt;&gt; raw dump of smbios then you only need to add mdr
          header.<br>
          &gt;&gt;<br>
          &gt;&gt; See answer for the same question here:<br>
          &gt;&gt; INVALID URI REMOVED<br>
          &gt;&gt;
          021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-<br>
          &gt;&gt; iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$<br>
          &gt;&gt;<br>
          &gt;&gt; On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen
          wrote:<br>
          &gt;&gt;&gt; Hi Andrei,<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; I see output of &quot;dmidecode --dump-bin&quot; follows
          SMBIOS specification.<br>
          &gt;&gt;&gt; As<br>
          &gt;&gt;&gt; the data for smbios-mdr does not follow this, do
          you know about the<br>
          &gt;&gt;&gt; document or any information I can reference to
          prepare data to send<br>
          &gt;&gt;&gt; to BMC??<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; Best Regards,<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; Thang Q. Nguyen<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; On 14/09/2021 15:51, Andrei Kartashev wrote:<br>
          &gt;&gt;&gt;&gt; No, it is not same as &quot;dmidecode --dump-bin&quot;.<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; On Tue, 2021-09-14 at 13:46 +0700, Thang
          Nguyen wrote:<br>
          &gt;&gt;&gt;&gt;&gt; On 13/09/2021 23:56, Andrei Kartashev
          wrote:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; You need to somehow deliver smbios
          data image to BMC. This<br>
          &gt;&gt;&gt;&gt;&gt;&gt; means, your BIOS should implementat
          some logic to transfer<br>
          &gt;&gt;&gt;&gt;&gt;&gt; this data.<br>
          &gt;&gt;&gt;&gt;&gt;&gt; For BMC side see example here:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; <a href="https://apc01.safelinks.protection.outlook.com/?url=https%3A%2" rel="noreferrer" target="_blank" moz-do-not-send="true">https://apc01.safelinks.protection.outlook.com/?url=https%3A%2</a><br>
          &gt;&gt;&gt;&gt;&gt;&gt;
          F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;amp;data=04%7C01%7Cchli<br>
          &gt;&gt;&gt;&gt;&gt;&gt; 30%<a href="http://40nuvoton.com" rel="noreferrer" target="_blank" moz-do-not-send="true">40nuvoton.com</a>%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931<br>
          &gt;&gt;&gt;&gt;&gt;&gt;
          d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow<br>
          &gt;&gt;&gt;&gt;&gt;&gt;
          n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik<br>
          &gt;&gt;&gt;&gt;&gt;&gt;
          1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=cG6ZZzOSXkuUtcQuuoymsRdP<br>
          &gt;&gt;&gt;&gt;&gt;&gt;
          p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=0<br>
          &gt;&gt; oem/blob/master/src/smbios<br>
          &gt;&gt;&gt;&gt;&gt;&gt; mdrv2handler.cpp<br>
          &gt;&gt;&gt;&gt;&gt; Hi Andrei,<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; What is the format of smbios data to
          transfer to BMC? Is it the<br>
          &gt;&gt;&gt;&gt;&gt; same content of &quot;dmidecode --dump-bin&quot;
          command from Host Linux?<br>
          &gt;&gt; or<br>
          &gt;&gt;&gt;&gt;&gt; anything special in formatting the
          content to send?<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2021-09-13 at 17:40 +0300,
          Alexander Raih wrote:<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi guys, I am beginner in openbmc
          I build openbmc with<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; smbios-mdr repository and I have
          error:<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; Read data from flash error - Open
          MDRV2 table file failure<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; There isnt file in
          /var/lib/smbios/smbios2<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; How I can resolve this problem?<br>
          &gt;&gt;&gt;&gt;&gt;&gt;&gt; Help me please!!!<br>
          &gt;&gt;<br>
          &gt;&gt; --<br>
          &gt;&gt; Best regards,<br>
          &gt;&gt; Andrei Kartashev<br>
          &gt;&gt;<br>
          &gt; ________________________________<br>
          &gt; ________________________________<br>
          &gt;&nbsp; &nbsp;The privileged confidential information contained in
          this email is intended for use only by the addressees as
          indicated by the original sender of this email. If you are not
          the addressee indicated in this email or are not responsible
          for delivery of the email to such a person, please kindly
          reply to the sender indicating this fact and delete all copies
          of it from your computer and network server immediately. Your
          cooperation is highly appreciated. It is advised that any
          unauthorized use of confidential information of Nuvoton is
          strictly prohibited; and any information in this email
          irrelevant to the official business of Nuvoton shall be deemed
          as neither given nor endorsed by Nuvoton.<br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------57DBF0C4262A75DF3E1AA120--

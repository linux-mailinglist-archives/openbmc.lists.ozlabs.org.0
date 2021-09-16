Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55640D851
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 13:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9F3S6Hcyz2yPT
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 21:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=zPwYdmjW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.127;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=zPwYdmjW; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2127.outbound.protection.outlook.com [40.107.92.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9F2z2vxtz2y8R
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 21:19:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsdgg5N0Dp02YjbjcsCn44wdVAZm90aoLKz8Tst5Srctch7cydrQxwqgh6foEJVBVaQw66leZ/QtDHeDyCAzwyy9UafecQn0dxFFZu80jMhBhegVE3849fxmVaCBy32pjUB9vzTUmawJTdOrS7ww+FcGNRZfh2+DMg8edSQYuYJB6TgEO4QSzBxs1AV4oSLUSf9LT4d935bFIpIhkMku7ddoSsfKY0AO59KddsJwngVP3V/eZsqGUO1mXVXKB1mHAR/i+CvEc5MKzs/opdWq+UrpcmFRD39PiLurhdkrwZJJ1BOYpk02lQDoEc9KHpP/Wu0wHEvumkVj0UR+Zes1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=AmYRiPeBbR1gXrgv3+e3JKsKf7Y/0zsub6NwaT6ZtDE=;
 b=FlrVVofKrOEA8ez8ELBLcwTppyEgOr1y5x1G6T4Vzjf90quXSkhJ8VhcaWonnrkDPylRjtB81PY2T6gVvXvNYwnP5izT2wuTCgLLgQqkkoXo1H+XOd4XvAX61+6pyz2H/EOgrUYhXDC7jUiofmujIELp8TOgN2xyuhdJlJ1oIAhVBV3zff8W7ji0gnlFneiJ8UWBFpy0aH85VqgGsEs1vtHOmmZRYR9HM8+yU9OmUoTrG9OXhf+ch2Vb7NeEkGSG9vx0aWBQ6M/9NBPE33sP0lszdDBCtTL2Zv1UF/aG2FQoGSkUm4gCyQGjsu4dMDVVLdRmZpV/1iYbH/FbRp2oAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmYRiPeBbR1gXrgv3+e3JKsKf7Y/0zsub6NwaT6ZtDE=;
 b=zPwYdmjW9mOiTK3MzkG0FNHUCj9eFEWF9UcXroxLg6Xq1uPb4boz70ACsV3OgaKmZM258Tj+10r5n/9ws01ugPI9phWXG/d7L5+ipEWKBNqjyhZFKWAhOuqXrinydB4H5XpHk4CG4muRglF+Rt+ogf6iWZER3ZSKFiU/VR/2HSQ=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB5191.prod.exchangelabs.com (2603:10b6:a03:7b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Thu, 16 Sep 2021 11:18:46 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc%6]) with mapi id 15.20.4478.026; Thu, 16 Sep 2021
 11:18:46 +0000
Subject: Re: Read smbios2 file failed
To: CS20 CHLi30 <CHLI30@nuvoton.com>,
 "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>,
 Andrei Kartashev <a.kartashev@yadro.com>, openbmc <openbmc@lists.ozlabs.org>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
Date: Thu, 16 Sep 2021 18:18:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from HCM-FVFX4014HV2J.local (42.116.120.79) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.1 via Frontend Transport; Thu, 16 Sep 2021 11:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 365e976e-9bc0-451a-9cb1-08d97903c012
X-MS-TrafficTypeDiagnostic: BYAPR01MB5191:
X-Microsoft-Antispam-PRVS: <BYAPR01MB51919CEFA8319C8BB9DDC1E28DDC9@BYAPR01MB5191.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glsvbsGg/FNT4bJ4tDDn+uPj42gZEW9iUyvU4cPtoSR2W3WMYvJvnln9HnfbUI8ycqE7qoknoUiRVewie26n3V1ZKbVlf7sbP8YZxyKY653zsGj+B4qAPXFKmWkrVY2sQEC8VQHsSfsd2GgIFbdDsSu5oVGEwrWiihIv6TcXJdiwWODJxZ5WNnCfKxLM31uosFbS7FrkN2ITttWOkU9GxTfnOGItC8vSTki6UsSSXxByiQZ+hd/wvZQRZ1cnV0p1uZp+90FxIsTsfTY0s+mJUaEduod0km7wWMqbGYlAoBmUSltqF0YZga4bTNH1YzdKNiR++Up3VqwLV28H64ehB+qsDc9thNLA+BWKgp15UI52v6ZOb6m9XkvL4FIPx9TJNB7BXS/GO5tzgUIQumK+F+qfav95cUE+uQsO/+kEY9xr1c5iGttkShTSepjRLK236MWYZn1VUZEQC3ddMF9Oe0lkg+I0Ca3VQuXA2Nshy/zdpa5TGQ3lFbnJzFkcCfucn3YWldmnQSeq0V1hjD0Ig7/UYRHP4OKwR2+YfYTeACLrr2lwEZGEN9VrbSH83TPe54tvlL5zS+fZQ5QCVNFzpllNBPWUnPfxEqtXd2ZjJlT10oos2URxi0SNM1VsQcch3iFn69nzAD70WHT3b7gOKAUnb2Gs4WtpUArnw/c2+QpzbBgNvkrhpsE3mQk2NFdnyaRo/0zwXT/YwEDKT1QPl+mrS6ckyefXQ4TibcLPdGk99q/r7OcGmi5lMEvY5QpJ4NYlIemNBqCZ9fNY5uuinkFjSVM4DZP0rne2ui1kqRQN8TTwnGMsRFHA0R0v6xnClZ9YKWbQl3xQttpxLWqSOv2DK8UEeldtL15KzESXgh496cnvkyWNpB58iKjDLmRaKfNmXr8b2Rnk1VocMV2wjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2906002)(2616005)(316002)(6512007)(66556008)(8676002)(66476007)(956004)(6506007)(110136005)(6666004)(83380400001)(31696002)(508600001)(53546011)(66946007)(38100700002)(6486002)(38350700002)(5660300002)(31686004)(966005)(26005)(42882007)(186003)(8936002)(83170400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?engzQ2pZVlpKM0xwaUZyM0Z0RjJFNU9pMFBrZkxHQjZ0RjQ1c1FuQ0ZnL2Mv?=
 =?utf-8?B?RXViWkJML3oyb2JheXhjRmlidzdCdzBJbURhbk42cGZCL05MZHF4S3VnbWY3?=
 =?utf-8?B?QVNrTGhqK01KcmlnV05tMGZ6VTRYQ1RTSU9ZQjJGSjJPb1QzSHlab0x5ajB4?=
 =?utf-8?B?WmRnNWhOZGxJTXJuVmIyV2NrZ0VpSmZxTHJFRDNhNU9rbEJsRlpzLzhPNTBk?=
 =?utf-8?B?WFdpL2NVV01rbzZQcnlqUys2RTJxSHJsQ1lmVzdGenp3dmVaUU9jR1AzNW9J?=
 =?utf-8?B?alhMZ1YvODVOUFJ1OEFXcHUxKzBibHhjME43dTVJQ2FwOUorc3BOUzJZenI4?=
 =?utf-8?B?ZWxmWUtmRnJ1eHZneUQxRFVtd2d6YUZXd0x6MlpPdTN1d3pURjFwK2NhTU9o?=
 =?utf-8?B?cUMzR25udHU2U1d1eGFMd2NXUnA3bEl6a3NxbjJzeDYwMWttRFBlZ3BBT0Zq?=
 =?utf-8?B?azl1QTl0Z1orN0k5MzhGUC9zcThwYmc1Ui8zb28rM1RJUGs1NjFFd2FyMW4y?=
 =?utf-8?B?Z3VwYk9zUEsybGZGQWUwQ2lIMFNQemdGVjNZZC93V3dURG9MNFRNd0pDWmNB?=
 =?utf-8?B?b2Z4blFGTUkzck1pNWc5Z2lZQ0E0S1JQWmw2NGNZQVlPYmhsak02WWUwdzly?=
 =?utf-8?B?MnFBRkQzRml4dmdZTnlnd2loUHBXbmwvSTdUNmF1eTFOYklmSHFUTy9OVmdk?=
 =?utf-8?B?SXZKTlIzSmVSV1JvZHB3eSs2MDZsMGJpdTd3cVhPajZOWVVWMUxMcytlc3ZB?=
 =?utf-8?B?QWd4a3ZFSEpQelg5bCsrMWdpbzRuVndwTDBkMDBRb1Z6OExlMEhGbU5ZVXJU?=
 =?utf-8?B?MXpqY1B0Z1pjZkZEYlFlRHdqNVdZdDZVcEZaNUovN3VGV0pscSs5U0Yxb3pY?=
 =?utf-8?B?aXR1ZkszY2pZNkVZR0dMcGJ4b3BzNGpqMXU5Z3RJUjVhNFdaQnFSRXBJTDg1?=
 =?utf-8?B?dXdIS21wZENPS2gyY3RPYlRPQTUvTjdlTUhXZ1g0ZTNrR3N5MXJ6RTN5K2V3?=
 =?utf-8?B?b1RJRGJEbDNJQVNCa2pEUU9XTnRFVllCVE5CT29RK2oxOFFUaFVkZDVXYUFK?=
 =?utf-8?B?NFVTUjU1ZFRFa1ozOHJEMklHbTRuak95WTJ4eUFuODFuM2ZLNDJFY0g4M2xP?=
 =?utf-8?B?a1hrL1pjZnUxdDhEMmIxaUoxQTVVdkdMckRxTkJaTkRHaVNmTjIzTDl2N1Q2?=
 =?utf-8?B?dVZwaXRTcTcvemFTd3UrZndaMUs3ZnpURHFwL3psWVIvTmZaNjVFNkNnVm5C?=
 =?utf-8?B?ODdIeG9yNklSMlFjQ0kxcXJiUW4xK3crN0d1c3NYbGFtOE5EQUIvRGp4NVhP?=
 =?utf-8?B?UU5tdy9oeERDZGFXbjZkNkc0Sk9YcGN6a3c3cmMxR1Z1Tm5BS0NETWE0RDNF?=
 =?utf-8?B?R3VPMUltNnlnYXY1U1kyeTVlT2w1dS9zK29TbWp0TjJ1UkwzTHQ3aXNxQVUv?=
 =?utf-8?B?eVhOWDlQeHpMVWVEME9mS1lFU3R2NTFmNGNRS3RrckdsMHhBTFdLbEQxYXVh?=
 =?utf-8?B?Q2xSNlRaaDl2cnBxSWJ3c09XUzFGQjFPVEdhMnA2Y2p1VVR5S1ZTRFpRS0xj?=
 =?utf-8?B?enFsRHd3R0FNaG1WNVhGOEdQQVVsdlF5bFZzTVNjd3kwYllSMFpCalVjc0xR?=
 =?utf-8?B?YnY3dDVGRFZkSTVqOE1XMHJxV2pLbU83UkhaK2EwV1ZnYVpZallhd0NrSDNW?=
 =?utf-8?B?MlpJYWJmVDY3NE5iOHpTeTJJS3VJNDBGeGw4ei9IQzJ0NmVjSERHQUROZ2Fy?=
 =?utf-8?Q?16sfYTb/vUyj0Fu6yibzGheWex8d48AXdPQ+bKv?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365e976e-9bc0-451a-9cb1-08d97903c012
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:18:46.5203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sh2DziVcL9T9rHbp0P2bwAnwXoNrEsXWPneZ66DV1TUtXs0a8RzDaZwZSZSQ2U5FIvLdwnrjEQWKkHDxO7XFVY8pt6a6J+iAv7BTXtxF4vi7RjN4SvBVgy+BDVLb6dz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5191
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Tim, Mike and Andrei for very useful information. We can make it 
work by adding MDRv2 header.

I am finding some information about the IPMI blobs commands. I can see 
some notes at

https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md

https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md

But I have not found more description about the IPMI blob commands like 
NetFn, Func, ... that I can send a file from Host to BMC. Do you have 
any information about them?


Thanks,

Thang Q. Nguyen

On 16/09/2021 09:40, CS20 CHLi30 wrote:
> Hi Thang,
> Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/smbios/smbios2 for parsing?
>
> You can refer this sysfs-firmware-dmi-tables as below:
>
> The firmware provides DMI structures as a packed list of data referenced by a SMBIOS table entry point.
> The SMBIOS entry point contains general information, like SMBIOS version, DMI table size, etc.
> The structure, content and size of SMBIOS entry point is dependent on SMBIOS version.
>
> The format of SMBIOS entry point and DMI structures can be read in SMBIOS specification.
> The dmi/tables provides raw SMBIOS entry point and DMI tables through sysfs as an alternative to utilities reading them from /dev/mem.
>
> The raw SMBIOS entry point and DMI table are presented as binary attributes and are accessible via:
> /sys/firmware/dmi/tables/smbios_entry_point
> /sys/firmware/dmi/tables/DMI
>
> Best regards,
> Tim
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+chli30=nuvoton.com@lists.ozlabs.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
> Sent: Wednesday, September 15, 2021 9:19 PM
> To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> Subject: RE: Read smbios2 file failed
>
> We recently did the same thing and got it working.  All you have to do is take the RAW smbios records blob in binary form (delivered as noted below in whatever way you choose) and prepend a specific header:  https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;data=04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=0
>
> It is a little bit fragile as it introduces a dependency on the file download logic to write a non-standard header defined in another service that could potentially change.
>
> Mike
>
>> -----Original Message-----
>> From: openbmc <openbmc-
>> bounces+mike.garrett=hpe.com@lists.ozlabs.org> On Behalf Of Andrei
>> Kartashev
>> Sent: Wednesday, September 15, 2021 3:17 AM
>> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: Read smbios2 file failed
>>
>> I don't know what is format of "dmidecode --dump-bin", but if it just
>> raw dump of smbios then you only need to add mdr header.
>>
>> See answer for the same question here:
>> INVALID URI REMOVED
>> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
>> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
>>
>> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
>>> Hi Andrei,
>>>
>>> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
>>> As
>>> the data for smbios-mdr does not follow this, do you know about the
>>> document or any information I can reference to prepare data to send
>>> to BMC??
>>>
>>>
>>> Best Regards,
>>>
>>> Thang Q. Nguyen
>>>
>>> On 14/09/2021 15:51, Andrei Kartashev wrote:
>>>> No, it is not same as "dmidecode --dump-bin".
>>>>
>>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
>>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
>>>>>> You need to somehow deliver smbios data image to BMC. This
>>>>>> means, your BIOS should implementat some logic to transfer
>>>>>> this data.
>>>>>> For BMC side see example here:
>>>>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2
>>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=04%7C01%7Cchli
>>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
>>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
>>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cG6ZZzOSXkuUtcQuuoymsRdP
>>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=0
>> oem/blob/master/src/smbios
>>>>>> mdrv2handler.cpp
>>>>> Hi Andrei,
>>>>>
>>>>> What is the format of smbios data to transfer to BMC? Is it the
>>>>> same content of "dmidecode --dump-bin" command from Host Linux?
>> or
>>>>> anything special in formatting the content to send?
>>>>>
>>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
>>>>>>> smbios-mdr repository and I have error:
>>>>>>>
>>>>>>> Read data from flash error - Open MDRV2 table file failure
>>>>>>>
>>>>>>> There isnt file in /var/lib/smbios/smbios2
>>>>>>>
>>>>>>> How I can resolve this problem?
>>>>>>> Help me please!!!
>>
>> --
>> Best regards,
>> Andrei Kartashev
>>
> ________________________________
> ________________________________
>   The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.

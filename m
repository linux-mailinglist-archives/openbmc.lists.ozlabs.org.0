Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C43307BA
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 06:53:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv6vg5vzSz3cLN
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 16:53:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=IwFV7EWH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.115;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=IwFV7EWH; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2115.outbound.protection.outlook.com [40.107.220.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv6vN2m36z3cGn
 for <openbmc@lists.ozlabs.org>; Mon,  8 Mar 2021 16:53:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1u1lKsB+/A7dF1SrBTq6GfF2sOyzYGCAiV4a808cnJ+c+VjF01Ww/pMPl4TiGlIRxnmXeT7SifOAMBJeOkWY1P1uR/out7SvstffSSuRf6W0jwNJHqzrZcI5a825mllxFUm/IUV6gajF/K59Q8IGDk6pNknyVAsrskYUm6kWVeV4nJf1rQH2yvXnXOEQlhvnZr4b0AgdBQCE9f2bUEWgKdYvMhbqK0+IMchW0XF1ZqAi6UtuvWFsrdbbG4iGr4PnR2kc/Dz4IA9uASQcLLykdPPpXthrW+0vdxZJbz5HI40ZmQ/3CmuMxUISNCYvSMJWOZUOJxE2I7kkk2LXHOf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcZiKEEpviXRiGiIUHruAF0MqfpoYk+4ELkEDH204BU=;
 b=EJ0Szn+oyOYLc9ZGdPzxt6yeUAUy66nYW4/TYSeV90PEoW18mtyK/rjtqFCuEG3a3CRHKnEsjjAPV2TgCiNEYl4Q8VZ8M7/7Klvla+0ALnBwwkgw2e4qjur7XDzVkXB5CBvRODo6ans70OD6zKz4dZknxVU7r8De7XHDcmTpTh/RigJQo3PmtSVAoW7EEInspyQTsUzEtQUMd5rVwUYFlL8nE4n788umFLYzr4a4U+tsjqaE3up8MygOCL71+IMryMipcO/2V84qIfSPfyLpasHluJJf9PpzIBBCvvIlHY2XbmU/CZZ9adQrVp0y0OvbuL1kenC1H1Ibj3SjfVa5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcZiKEEpviXRiGiIUHruAF0MqfpoYk+4ELkEDH204BU=;
 b=IwFV7EWHoPYN4/4wFM2sm9Aohq3BcI/QpyYrkNmzhJfnsxAWWquhbED1Em65XAId/QAt/3rXzxldUzpyD7L4Jsx+i9oax0e0HZFockX8U1CV4uszSaeytP0ACZoKlupInngDUAaLLIjnsjhK1Fn2EZvuq01mEUifXs7B9oG3k4w=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY5PR01MB5890.prod.exchangelabs.com (2603:10b6:a03:1cb::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Mon, 8 Mar 2021 05:52:49 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3912.026; Mon, 8 Mar 2021
 05:52:49 +0000
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
To: openbmc@lists.ozlabs.org
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <8bfeaac7-8e70-c45b-8a87-8ab7d667cab2@os.amperecomputing.com>
Date: Mon, 8 Mar 2021 12:52:41 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------0BD4431E352BD64A0ABD2DD3"
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:c8::20) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HKAPR03CA0015.apcprd03.prod.outlook.com (2603:1096:203:c8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Mon, 8 Mar 2021 05:52:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 673ca1df-a83c-4994-1b14-08d8e1f66787
X-MS-TrafficTypeDiagnostic: BY5PR01MB5890:
X-Microsoft-Antispam-PRVS: <BY5PR01MB58905B7DB16D19F5B813AD168D939@BY5PR01MB5890.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0ouTk1o3nqfpQ2l7ZVBO9iD0vZMA8kvBXsiD1alL+/i6GICTVAH7/CdV3juyjbdEf8xOJqENBYYgRyo2+tGoA8yFaRcNuraMdOzWhAqg1nM+4hNjwXMJdbNkP+zUjnC72tslUNW/hM9tDTdsyAamivPkR2BIwObVXUQFvqc6xXRcoodxPkz0PawDsJNwyRFOwfWcKXybvIhwwyFlR3qwb+33gVQZNF2+2Ntw9piUAp/4xqWHi5zSObRTNEXA3qD9NWnIUZNmMPHwgf5EflNpAjKreWNlf9jKbCbZXyIkCrMC6Ft26m3zfu9mwxxoZ22CWmmA9yMTon/GhHcZDa0cl8/YOvniVeTwHN+XK0qTM2DpjEIXbhQeC46ln6WAglAP7p8REXVLAPuE6/kWA4MasBV35OXYAUdj/dQ6A0V/QOJoHLZp58SVcnpqhEJZ99F98AZiYAjFZ5x/TNWB74LbZaZOIv/PJ5dNrU9uxvz6m+WjtKh+5k5w7Gzww9/jUwGb4PR/3PWWUFGeJKoHCHYbfR+7ou8YdcNfrfOokPxQ2D5JFWHsR2Yeh/wKsqlrkjkE6PdZXGx9utsWHldRGt+47j7wRU/n2NlOjYuIuV/+a8jc54LXw6JVHjlQD9N5y7lwFpQamswdzyLXsNi8SuBrH0yfPatFkV55h6yv+9t89ejbYQod/UEMN/oG29rimUE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39840400004)(2906002)(31696002)(86362001)(166002)(53546011)(2616005)(186003)(6666004)(6506007)(478600001)(956004)(26005)(8676002)(83380400001)(52116002)(5660300002)(16526019)(8936002)(6486002)(6916009)(66556008)(33964004)(31686004)(6512007)(66946007)(316002)(66476007)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a25aY1NkMmllckVjbmxmaENaa3JhM1A4cmhGbWlWb2lNb2dHZVZ1bTY1UHFa?=
 =?utf-8?B?V3ZQbDlGdXJ3R1UwK21nQzE3UWY5NUFWZXF5MEFKRWNKNEhUQWxycEFBUTRo?=
 =?utf-8?B?N2pYNFhrYnRaQ1N1RGxCaXZaSzAxN0U3VEpEUzVONlFTMjBLUDcwUGZyKzVt?=
 =?utf-8?B?a1p6eFRUeEcrdXQvOTU2alJhRXFDbVZzbEZzUzZ1YklydmIzU1RvaGUxZ1hn?=
 =?utf-8?B?UkJBanZZSjUrQnlBNFp3Ylg3MWMwRnpQeDloRm9TYnlUc1RVU2NVdi9CU1N2?=
 =?utf-8?B?ZDArYnZ1VGo3LytGWGVGdThVa1BPT2tuMmdQejR5UFdoeHRtVDFZRWZVMCtG?=
 =?utf-8?B?SDdXN2FWTXdpVW92cnZEQkp1eVNpMjA3cGMxTmowUk5XUmR5TjVDaENUdERy?=
 =?utf-8?B?dGREblg0MXFSYlNaeG9ETW82eGxWZG5lTzNpRDhVTU5lTmNNSFpuZTJCeWxm?=
 =?utf-8?B?Tm93NFBCWDVHdlBySlp5OXM4aUxCTzVuTkQ5OThjaWhHam5JWU45bWZQZDgw?=
 =?utf-8?B?UmtBd2cwRVRCUU5VaERweXA2WE1iaGtHeG5pNDJ0Rnc1L3cvamhaM0lCNWty?=
 =?utf-8?B?c1M5TEpySWltaFh4K0Q3K3dIdmh2ek0vVG1RZVVDV1MrSGZkeVJPSDFUM0hn?=
 =?utf-8?B?KzV2RmNZQmZhTkZIZ1BqdVVDNTZRS3ZETHpRKy9PRUc4SWZpRk11Z2V2QmNR?=
 =?utf-8?B?ZHQ5YmdvRzkvbGhSamxFNkVGNHdGM21SbGtISU5NRWF6Y0IxdFhXOUh4SDkr?=
 =?utf-8?B?TWlGWWhBWUg1UGJ2L08yVW1KdktIMjJoUHFGS3FsMG9NekxmWElxOTdpUHcv?=
 =?utf-8?B?Q2Rndm9ZNTd1TC8xMDNUL1dibTZLT2lnaExhdlQ3aUpiM1RyU1V2cVZ5YUJO?=
 =?utf-8?B?MGVnQTRhbmVGZzh3TElwdnZIcG5zZHhFV1NvcUxYeEtkeDRZSTlpakFvTk1B?=
 =?utf-8?B?QlZ2SWlBUUZNblVSbTUxZGxsSVUwZllRbzB3SGxHWHlzbzF4S0N1Y2Ryc2RO?=
 =?utf-8?B?ZmdEWEFXN1FMYkJGK2JvbllhQ2NPSWNGSThoUHhXNWhDOTk0K2hrb0ZxWkhz?=
 =?utf-8?B?MnpIcVhieG9VYklGVk1GbzI0RjU4bTZIdUsycUFJYkR1SmkwN3B2NlB2cTFM?=
 =?utf-8?B?UG9qNFNKeEVLM0UxWVk3VjVPNlpLWkYybFpCYzh1SGM3SEcyaDRYQzBkMkZS?=
 =?utf-8?B?Zi83L1htelRobjNSK3ROazRCbDVjc0tzNXM5Z3BKUkZJUFkyeGEzMWxRQmYx?=
 =?utf-8?B?NDZZVXhnUUV0bitlRWFlc1ZhNEVPb0dGOEwxeXBHd3BIQzIvWlhXWVpCKzVM?=
 =?utf-8?B?ajVpUGt5em0zOEp2TTIrQWZOajYwdGF4Nld3SUM3S2lQTERSTGwyejZNcVBz?=
 =?utf-8?B?R3FRV0g5anZESDlyOUZVdDRqUU9PWHptS1dBT0hZeXduZEFuSVowVTh1K2Ra?=
 =?utf-8?B?WmZBNmZoVWFab1lhRyt0Z09lb202ZGhrY1htbDMraXM3OHdHdW5kNW1BcWsz?=
 =?utf-8?B?UldIYVBIbmVYUVVYYUdSNDFINXhYbE9CaGV6Y2VCcEZ2Y1hZMFJ2QnlBV3Vr?=
 =?utf-8?B?THplU3V4dk9iZjJSVWk1aFplTTBsZEswcTd3NncxakJYL1dZcFhUWlhjY2xI?=
 =?utf-8?B?NUlVSDAwMDRVZDVnVWl5SUtkS0pFd3I0bjFJRUpIMWwwMTF1akdTbEhUclJU?=
 =?utf-8?B?enlmVVk3Z3FxUWtPRllFL2RDZlo4eU9OMEs0MTdVNm5LRlQvNHZkc0RCL1NQ?=
 =?utf-8?Q?WzoTFApLBNalNAeSKqPu1hI0aOSwU+QUBtWi28S?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673ca1df-a83c-4994-1b14-08d8e1f66787
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 05:52:48.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 677eN2xjge/iqK1Qq9jLIfPNvSDY1JzjCdFVaya9gCBt0Q7KYa1ZaoWC7uJ7PJmNX0QWsWi9lr2cfF1CZD6IyLZ89lgvfZZrsj6prrZrZgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5890
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

--------------0BD4431E352BD64A0ABD2DD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/02/2021 09:27, Troy Lee wrote:
>
> Hi Vinothkumar,
>
> Please refer to the following two changes in Gerrit:
>
>   * https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
>     <https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343>
>   * https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344
>     <https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344>
>
Are these changes merged? I can't access these links.
>
>  *
>
> Thanks,
>
> Troy Lee
>
> *From:* openbmc 
> <openbmc-bounces+troy_lee=aspeedtech.com@lists.ozlabs.org> *On Behalf 
> Of *VINOTHKUMAR RK
> *Sent:* Thursday, February 4, 2021 8:28 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* evb-ast2600: Getting some build errors - 'u-boot.bin' is 
> too large!'
>
> Hi,
>
> I'm trying to build for evb-ast2600 platform, but it doesn't succeed. 
> Please help.
>
> Build command: (fresh checkout and build)
>
> TEMPLATECONF=meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-env
> bitbake obmc-phosphor-image
>
> Branch details:
>
> commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f
>
> Error Log:
>
> Loading cache: 100% |                                   | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100% 
> |########################################################################################################################################################################| 
> Time: 0:00:44
> Parsing of 2424 .bb files complete (0 cached, 2424 parsed). 3683 
> targets, 362 skipped, 0 masked, 0 errors.
> WARNING: No bb files in default matched 
> BBFILE_PATTERN_meta-evb-ast2600 
> '^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/'
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.49.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-20.04"
> TARGET_SYS           = "arm-openbmc-linux-gnueabi"
> MACHINE              = "evb-ast2600"
> DISTRO               = "openbmc-phosphor"
> DISTRO_VERSION       = "0.1.0"
> TUNE_FEATURES        = "arm armv7a vfp vfpv4d16 callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-oe
> meta-networking
> meta-python
> meta-phosphor
> meta-aspeed
> meta-evb-ast2600     = "master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f"
>
> Initialising tasks: 100% 
> |#####################################################################################################################################################################| 
> Time: 0:00:03
> Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 
> 0% complete)
> NOTE: Executing Tasks
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_metadata: Feature 'phosphor-gpio-keys' not found, but 
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_metadata: This may cause runtime issues, dropping feature 
> and allowing configuration to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_metadata: Feature 'phosphor-vlan' not found, but 
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_metadata: This may cause runtime issues, dropping feature 
> and allowing configuration to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_configme: Feature 'phosphor-gpio-keys' not found, but 
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_configme: This may cause runtime issues, dropping feature 
> and allowing configuration to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_configme: Feature 'phosphor-vlan' not found, but 
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 
> do_kernel_configme: This may cause runtime issues, dropping feature 
> and allowing configuration to continue
> WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue: 
> obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]
> ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image 
> '/home/vinoth/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin' 
> is too large!
> ERROR: Logfile of failure stored in: 
> /home/vinoth/project/openbmc/build/tmp/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.2176796
> ERROR: Task 
> (/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static) 
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4041 tasks of which 2680 didn't need to 
> be rerun and 1 failed.
>
> Summary: 1 task failed:
> /home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static
> Summary: There were 10 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> Regards,
>
> VINOTHKUMAR RK
>

--------------0BD4431E352BD64A0ABD2DD3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 05/02/2021 09:27, Troy Lee wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}@font-face
	{font-family:新細明體;
	panose-1:2 2 5 0 0 0 0 0 0 0;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@新細明體";
	panose-1:2 1 6 1 0 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
	{page:WordSection1;}ol
	{margin-bottom:0cm;}ul
	{margin-bottom:0cm;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi Vinothkumar,<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Please refer to the following two changes
          in Gerrit:<o:p></o:p></p>
        <ul style="margin-top:0cm" type="disc">
          <li class="MsoListParagraph" style="margin-left:0cm;mso-list:l0 level1 lfo1"><a href="https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343</a><o:p></o:p></li>
          <li class="MsoListParagraph" style="margin-left:0cm;mso-list:l0 level1 lfo1"><a href="https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344</a></li>
        </ul>
      </div>
    </blockquote>
    Are these changes merged? I can't access these links. <br>
    <blockquote type="cite" cite="mid:PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0cm" type="disc">
          <li class="MsoListParagraph" style="margin-left:0cm;mso-list:l0 level1 lfo1"><o:p></o:p></li>
        </ul>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Troy Lee<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div style="border:none;border-top:solid #E1E1E1
          1.0pt;padding:3.0pt 0cm 0cm 0cm">
          <p class="MsoNormal"><b>From:</b> openbmc
            <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+troy_lee=aspeedtech.com@lists.ozlabs.org">&lt;openbmc-bounces+troy_lee=aspeedtech.com@lists.ozlabs.org&gt;</a>
            <b>On Behalf Of </b>VINOTHKUMAR RK<br>
            <b>Sent:</b> Thursday, February 4, 2021 8:28 PM<br>
            <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
            <b>Subject:</b> evb-ast2600: Getting some build errors -
            'u-boot.bin' is too large!'<o:p></o:p></p>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div>
          <p class="MsoNormal">Hi,<o:p></o:p></p>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal">I'm trying to build for evb-ast2600
              platform, but it doesn't succeed. Please help.<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Build command: (fresh checkout and
              build)<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal">TEMPLATECONF=meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf
              . openbmc-env<br>
              bitbake obmc-phosphor-image<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Branch details:<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal">commit
              7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f&nbsp;<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Error Log:<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Loading cache: 100% | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | ETA: &nbsp;--:--:--<br>
              Loaded 0 entries from dependency cache.<br>
              Parsing recipes: 100%
|########################################################################################################################################################################|
              Time: 0:00:44<br>
              Parsing of 2424 .bb files complete (0 cached, 2424
              parsed). 3683 targets, 362 skipped, 0 masked, 0 errors.<br>
              WARNING: No bb files in default matched
              BBFILE_PATTERN_meta-evb-ast2600
'^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/'<br>
              NOTE: Resolving any missing task queue dependencies<br>
              <br>
              Build Configuration:<br>
              BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = &quot;1.49.0&quot;<br>
              BUILD_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= &quot;x86_64-linux&quot;<br>
              NATIVELSBSTRING &nbsp; &nbsp; &nbsp;= &quot;ubuntu-20.04&quot;<br>
              TARGET_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = &quot;arm-openbmc-linux-gnueabi&quot;<br>
              MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= &quot;evb-ast2600&quot;<br>
              DISTRO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = &quot;openbmc-phosphor&quot;<br>
              DISTRO_VERSION &nbsp; &nbsp; &nbsp; = &quot;0.1.0&quot;<br>
              TUNE_FEATURES &nbsp; &nbsp; &nbsp; &nbsp;= &quot;arm armv7a vfp vfpv4d16
              callconvention-hard&quot;<br>
              TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = &quot;hard&quot;<br>
              meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
              meta-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
              meta-oe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
              meta-networking &nbsp; &nbsp; &nbsp;<br>
              meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
              meta-phosphor &nbsp; &nbsp; &nbsp; &nbsp;<br>
              meta-aspeed &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
              meta-evb-ast2600 &nbsp; &nbsp; =
              &quot;master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f&quot;<br>
              <br>
              Initialising tasks: 100%
|#####################################################################################################################################################################|
              Time: 0:00:03<br>
              Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0
              (68% match, 0% complete)<br>
              NOTE: Executing Tasks<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_metadata: Feature 'phosphor-gpio-keys' not
              found, but KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_metadata: This may cause runtime issues,
              dropping feature and allowing configuration to continue<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_metadata: Feature 'phosphor-vlan' not found, but
              KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_metadata: This may cause runtime issues,
              dropping feature and allowing configuration to continue<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_configme: Feature 'phosphor-gpio-keys' not
              found, but KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_configme: This may cause runtime issues,
              dropping feature and allowing configuration to continue<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_configme: Feature 'phosphor-vlan' not found, but
              KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>
              WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0
              do_kernel_configme: This may cause runtime issues,
              dropping feature and allowing configuration to continue<br>
              WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA
              Issue: obmc-phosphor-sysd: SRC_URI uses PN not BPN
              [src-uri-bad]<br>
              ERROR: obmc-phosphor-image-1.0-r0 do_generate_static:
              Image
'/home/vinoth/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin'
              is too large!<br>
              ERROR: Logfile of failure stored in:
/home/vinoth/project/openbmc/build/tmp/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.2176796<br>
              ERROR: Task
(/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static)
              failed with exit code '1'<br>
              NOTE: Tasks Summary: Attempted 4041 tasks of which 2680
              didn't need to be rerun and 1 failed.<br>
              <br>
              Summary: 1 task failed:<br>
              &nbsp;
/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static<br>
              Summary: There were 10 WARNING messages shown.<br>
              Summary: There was 1 ERROR message shown, returning a
              non-zero exit code.<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          </div>
          <div>
            <p class="MsoNormal">Regards,<o:p></o:p></p>
          </div>
          <div>
            <p class="MsoNormal">VINOTHKUMAR RK<o:p></o:p></p>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0BD4431E352BD64A0ABD2DD3--

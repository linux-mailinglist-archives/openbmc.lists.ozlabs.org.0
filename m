Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F22C394D
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 07:49:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgs2V5hhrzDqbC
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 17:49:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.95;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=FlaTvV+E; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2095.outbound.protection.outlook.com [40.107.223.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgs1H3V6TzDqVl
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 17:48:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNuoHh6+n2/HTElpDrxYvsMWwEN/i6Sbs3oaQ5y2XO0A8h4rLJmlCaAJn05wJoO2Xj0tU0QiBMJlhwryWDsBYBVX55zUlbAUmbiekn5b4RNZR6KKT1cpajirNLjSdEJ71Ck4d1F5uRyxY50VWkKL9lAuIltVWzBM2O4uY3gXA/lXEc/AP/3Y8eOUb95LlDecKJdnyycW5gmj+89OmTYbLuWhozXFqfKYCmo6uJrcritR8pYGzorohfTapkCs658eLbobkurMOCCq6CNj3Tuh1yHBdYxZ2jsD7cfQSEBfmtZtloW/zWFQ4+tR6dD4fFJswNlaada7S140vczZILublw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEhseVxxQ2xN8TAP/iwvf6B9aAxnzqiFNkuy9pbe4AE=;
 b=H5R2hZU+o1TITfrmPlarOe3JF4Xxhmb7Fez4P0wdaghms+SrmBFudCLE5Ky4vM65MqE+s1GAxMqIZDADoq5OIONihhwhnK3K3v4q6yvF/lsxcMWm78V+YgLSFI30r6YZ3WBp4/8IoKS9nlLiZISNUO5sf/xzSIADxaVQe51AZl8zm4QDyBX822t4Or0F7pM7w9uSOlpSJcIf9rAvfwY7neKyDO1KppKPiw5FnrWzt0CRyUdMHXUzu1fUOtkHvDFVfDYlfSIxzFVq3Drk1D59Up3i6FQIioEyOcIkiRvs9RSuOeQGaBWNPjhHzlmSjjR5jzXwESzf8aN7I0PAN9cbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEhseVxxQ2xN8TAP/iwvf6B9aAxnzqiFNkuy9pbe4AE=;
 b=FlaTvV+E89iQmZDgCFegyccW1Jx+xK2XabVJVBJRBteNKp8Jw+tUlGUcZ6fiaVJu6cWPlvsJM9et8z494iuB2LLBltFsKdxFs0kTd+8vKPHXDuhYMk/XuHvVTbZlmiERnT2pF0llD0gQaRfnIZhcK0SSwt41oV1diZcvRsQH5BE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB3263.prod.exchangelabs.com (2603:10b6:300:fd::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.24; Wed, 25 Nov 2020 06:48:42 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0%2]) with mapi id 15.20.3589.029; Wed, 25 Nov 2020
 06:48:42 +0000
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Request for ssifbridge repository
Message-ID: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
Date: Wed, 25 Nov 2020 13:48:34 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:c9::8) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.219] (118.69.219.201) by
 HKAPR03CA0021.apcprd03.prod.outlook.com (2603:1096:203:c9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Wed, 25 Nov 2020 06:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4493c8f9-4f63-4a93-012e-08d8910e2573
X-MS-TrafficTypeDiagnostic: MWHPR01MB3263:
X-Microsoft-Antispam-PRVS: <MWHPR01MB3263EF24709E529F45809A3E8DFA0@MWHPR01MB3263.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LO6BVmNMIiE6+1TGDvU1I3OJAcfA3V98AocygzQjEmn7pFa1XXoNvOPaYVJ9gbJzfwwXwUekdu8FsvFyeXPoQhIlF2nnEm4rJnA4S+HuLgDBNQCm3R+/7oXgWtdAjOqGi24zHf20dAfYH/XkLDMnwL3Tj04gFIBGyUgyesa75gvEyVSbLPyvdBojlE7kPevx2a0B2gvzjWw4iupJ25oAgDwXY60inMx4awNxvUxjpvBkLHfhXex47p426hKnOHJDhSRWeprBU06I0IlzkEDV/vDuBwJvetqAhzAqP8BeaFrDjkaSIfoMeJthY/0HE/vU6A5+g92V+njMx+EFgTneL6Erq6elicKCsc1UqUSccBOqYdDPZk+qtJv9HunomSsz34vmKLzRfYDOJPcQisldsmpYM7Ls66wuJ6SXClnqetSB2le+gaibcxhNTqCykFoQGgdLYbTqhZtfAtMk8rWMq+n9ct8tA+pgKtaalknnxks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39830400003)(16526019)(16576012)(966005)(52116002)(316002)(558084003)(8936002)(6666004)(956004)(2616005)(31696002)(6486002)(186003)(6916009)(66946007)(66476007)(66556008)(8676002)(2906002)(3480700007)(478600001)(86362001)(31686004)(26005)(5660300002)(4326008)(41852002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xEjRdhye8rpYkq/PxxG6RzN2ncBIX/aoskLOnpDN8kycroRDo9KDHYRbxHe72FkmOWc351yxixirDtet/4PGZjIo7JozNjwwH86wTd5D4p6cBUu8c+UmlEQFlzvqygIPk9S14IOMAi0NjX7f0W2VdTBtjcVLDG1k21oH9+61GS4lT//HBYZ9YXf+mAKCJVXHhB0y3BiShGH9m4o5oOULP6T4f4PPWox7hlGYte7XZS7GW/DKPT1hchtlYDZ8jUhRumKL9hr95XuW4MNL+Zl254yAsqqC/HeHnJws6Ynjr2qJbEySLt0a0rCddC++48VmRr5HuzzjkNURc2LHwhxXLpY8rHcH0RCxfmtkxWbpaoNTR4SiO2bSnTFKQS/kp7AbFUV9Ja2/VzSP8TRvGQPAYU9D5HtiKz51BuK4SQKiTWib/+VKDpGs+zw2itAsY8gVB7Ds5nnp2nbY0tAhclYcx76mPJcpz3H431qDIOj+7cPFbF70zqHcRy+qd5Xj7vxOaNZ+16usHDtjWnvx8CNax0h2PEYUWxkxJbzZJQ8mQp3QjLiYPOQS6gDn7XsRv02TmK/Glj0D5jgTZpNuzswYhtOkEA3+WrfqAea6jdZF/aX5/JsVCR89ww5T+Y70eCqULAjdrPNPvl/Zb7KVGZzJoudQQqrgC1W5dKPFIzS/sbqhg7CyZBa6B9XWUH7UXdfQaa1IFoC4aALS2w2iy3Ncr6LhqbHQSl/bzN3bbHGFGUSpA659ELR1rVCGIoGb0IlVKZfFbbqD84UDipi9Ti3u0y5quIrARSm94CHQneiCpUpW1QqIe8byICcr3595qxiKYFT35mUONOJjZpEtJyCtOgB4eYDDZnUEh2KgRjp2RQHc8KFOqHIYRKgggedNQC0tYLPtMFzuaYs+szvRSwDIJw==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4493c8f9-4f63-4a93-012e-08d8910e2573
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 06:48:42.0077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFOHvTt2DTsWsSD7THZJqXbB5jt1b53LMaed4P1Zg69BXrs/Z7rh5MjCMs6pgG90n0WwgOg6YFdm1hd5h4Il8KD68vJHme/CyDZ3tC4HNwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB3263
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Could you please help create a new ssifbridge repository under 
github.com/openbmc folder? We intend to publish our SSIF bridge source 
which is based on https://github.com/openbmc/btbridge but apply for IPMI 
SSIF.


Thanks,

Thang Q. Nguyen -


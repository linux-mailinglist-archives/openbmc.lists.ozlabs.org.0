Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72F336A72
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 04:11:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwv9l45pQz3cNd
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 14:11:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwv9Z0NSZz3cGd
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 14:11:27 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 12B32iEG091880;
 Thu, 11 Mar 2021 11:02:44 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 11 Mar
 2021 11:11:08 +0800
Date: Thu, 11 Mar 2021 03:11:07 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
Message-ID: <20210311031107.GA2095174@aspeedtech.com>
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <8bfeaac7-8e70-c45b-8a87-8ab7d667cab2@os.amperecomputing.com>
 <20210309221020.ut4gds26ivcp6mst@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210309221020.ut4gds26ivcp6mst@thinkpad.fuzziesquirrel.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 12B32iEG091880
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
 Thang Nguyen <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

The 03/10/2021 06:10, Brad Bishop wrote:
> On Mon, Mar 08, 2021 at 12:52:41PM +0700, Thang Nguyen wrote:
> >Hi,
> >
> >On 05/02/2021 09:27, Troy Lee wrote:
> >>
> >>Hi Vinothkumar,
> >>
> >>Please refer to the following two changes in Gerrit:
> >>
> >>  * https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
> >>    <https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343>
> >>  * https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344
> >>    <https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344>
> >>
> >Are these changes merged? I can't access these links.
> 
> Hi - We changed our process a bit and now patches are to be submitted to 
> openbmc/openbmc instead of openbmc/meta-aspeed.
> 
> To help with that transition I thought it would make sense to mark these 
> as hidden in Gerrit, but that seems to have gotten in the way a couple 
> times now.
> 
> I've changed the project flag again on all these meta-repos to read only 
> - you should be able to view them again now.
> 
> If we want any of these merged - they'll need to be re-submitted to 
> openbmc/openbmc.

That explains why I can't find these patches a week ago, and it appears
again yesterday. Thanks for pointing it out, I'll re-submit the change
against to openbmc/openbmc.

Thanks,
Troy Lee


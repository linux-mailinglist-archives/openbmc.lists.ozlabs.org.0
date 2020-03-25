Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE26192F06
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 18:18:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nZbC1wGPzDq6B
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 04:18:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nZZT6nF8zDqN6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 04:18:08 +1100 (AEDT)
IronPort-SDR: L3SrQPgGOnaRsK5HPoVxb6zYloBchh90gdhxTVd1celNpev1Abd589SikG5CQqMFKuJoinUOWd
 4GgEQBLsA/hQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 10:18:04 -0700
IronPort-SDR: FxhcesTVRDj85Bdv2J/F9XxzgCB8qHLsIA9F2fvqXiPo2wzOaiv+GkXQcyempT0t/fA0gKNCft
 AXfNTjGX9WEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="293397681"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2020 10:18:04 -0700
Received: from [10.135.44.122] (jmbills-mobl.amr.corp.intel.com
 [10.135.44.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AA0CE580107
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 10:18:03 -0700 (PDT)
Subject: Re: Fwd: Which repo is more stable, feature complete, most
 functionality? https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
To: openbmc@lists.ozlabs.org
References: <8117ef0c5f9a4c599ebe1d53aae209b3@SCL-EXCHMB-13.phoenix.com>
 <CADy_Pt3xOgPXungY+nwpYjFVcvCqMek_gHLeFWXOUoSjLom3RQ@mail.gmail.com>
 <CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com>
 <b00d43e6-b296-a5a1-3c20-50f40bdfafd9@yadro.com>
 <1d2f080689bc4e4f839c95717f24377e@yadro.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <42bdacb2-745c-0e94-ad68-dba76a566937@linux.intel.com>
Date: Wed, 25 Mar 2020 10:18:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1d2f080689bc4e4f839c95717f24377e@yadro.com>
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 3/25/2020 3:32 AM, Alexander A. Filippov wrote:
> And by the way, the intel-bmc/openbmc does not build at the latest revision (commit 200ec68a685a48314076d82eb9af215ce256a02f).
> The recipe for the phosphor-webui has a reference to a non existent revision in the intel-bmc/phosphor-webui repository.

Sorry about that.  The fix is in a PR, but it won't build in the Github 
CI because it goes over the available disk space provided by the free 
runner.  I don't know why it's failing on this PR where the last one 
worked.  I don't think the build changed that much in size.  I'm going 
to look for an alternative CI option, but may need to just merge this PR 
without CI to try to fix the build issue.

Thanks,
-Jason
> ________________________________________
> От: openbmc <openbmc-bounces+a.filippov=yadro.com@lists.ozlabs.org> от имени Alexander Amelkin <a.amelkin@yadro.com>
> Отправлено: 25 марта 2020 г. 11:19:29
> Кому: openbmc@lists.ozlabs.org
> Тема: Re: Fwd: Which repo is more stable, feature complete, most functionality? https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc
> 
> James, I have to disagree.
> 
> The last time I tried (Mar 12, commit 276f647402), the openbmc/openbmc repo was still unable to control power of the host system on Wolfpass. That is why we're still using Intel-BMC/openbmc for our wolfpass-based board in development.
> 
> On the other hand, the Intel-BMC/openbmc repo lacks virtual media support.
> 
> We would love to use the main openbmc/openbmc for our x86 board but so far it just doesn't work.
> 
> Alexander.
> 
> 24.03.2020 21:11, James Mihm пишет:
> I meant to include the mailing list on my response.
> 
> James.
> 
> ---------- Forwarded message ---------
> From: James Mihm <james.mihm@gmail.com<mailto:james.mihm@gmail.com>>
> Date: Mon, Mar 9, 2020 at 7:11 PM
> Subject: Re: Which repo is more stable, feature complete, most functionality? https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc
> To: Bruce Mitchell <Bruce_Mitchell@phoenix.com<mailto:Bruce_Mitchell@phoenix.com>>
> 
> 
> Bruce,
> 
> The Intel-BMC/openbmc repo is where we (i.e., Intel) pushes our internal fork externally while in the process of upstreaming. The intent for this repo is for it to be functional on an Intel development platform (e.g., Wolfpass) at all times while upstreaming changes to the openbmc/openbmc repo. The long term goal is for Intel to be pushing all development upstream to the openbmc/openbmc repo, and using the Intel-BMC repository for sharing future capabilities that are not yet publically announced. Where our goal is to push our internal development fork to the Intel-BMC/openbmc repo every two weeks.
> 
> Two exceptions for upstreaming are the webui and linux kernel patches. Upstreaming the linux kernel patches is challenging and some of the patches may never make it upstream. With the migration of the webui to vue.js there's not much point in upstreaming the Intel fork of phosphor-webui.
> 
> My answer to your question is to use the openbmc/openbmc repository, but not for controlling your car brakes.
> 
> James.
> 
> 
> 
> On Thu, Jan 16, 2020 at 4:27 PM Bruce Mitchell <Bruce_Mitchell@phoenix.com<mailto:Bruce_Mitchell@phoenix.com>> wrote:
> Which repo is more stable, feature complete, most functionality?  https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc
> 
> While the WebUI for https://github.com/Intel-BMC/openbmc may look better,
> presently its functionality for BMC operation seems intermittent compared to the functionality of https://github.com/openbmc/openbmc.
> I am referring to basic things such as displaying the BMC's Firmware Version, the lack of displaying any NIC for Network Settings, the "hang" for Health Hardware Status.
> 
> This is not a request about ahead or behind; I am asking about stable, feature complete, most functionality.
> 
> Using a metaphor here; if you had to select today one of the 2 for controlling your car's breaks which would it be?
> 
> Thank you.
> 

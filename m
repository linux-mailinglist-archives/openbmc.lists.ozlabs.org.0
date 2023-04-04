Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 880946D5E19
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 12:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrPjt3C39z3ch5
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 20:52:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HgFk8cmc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=arun.p.m@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HgFk8cmc;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrPjJ0zTVz3bfk
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 20:52:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680605540; x=1712141540;
  h=message-id:date:mime-version:from:subject:to;
  bh=Nayf4c/PXQ6U4HIkA1GifdZEuEdq2lUW4Q7Coisji18=;
  b=HgFk8cmcWS34AmheMYhEvIzVKB+Z1Syu/XqZTg861rq4VmAHfMj3q27G
   oU9KT3OMZCDkInbDF4LLk3xbF6VvFSbfrJm4Dwb9rW2wuJq7QuOq26RxV
   gDQKh7O5YszFo2f3Hy5rzbrMxFpNX8J+8UCKaqf25inFs2Q7ZGhAfAnmU
   VFwmwfb1IQonu/1vqlnQO1Y85OAWqC1sYSzK0ESff5X1sQjxFiO2/ghdr
   jpFldAf6CBZ8LuG+h+YeQFuEY/xp7ELqSxz7R/tLFBPluNszX4XyMkkwl
   qa3a535/91rqQW+sZfNycOOLiDA6AwvQitHpFhBnmsJsFFgEtsPW5+j4E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="342173270"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208,217";a="342173270"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 03:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932419302"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208,217";a="932419302"
Received: from apm-mobl2.gar.corp.intel.com (HELO [10.213.96.53]) ([10.213.96.53])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 03:52:14 -0700
Content-Type: multipart/alternative;
 boundary="------------vEnRehTCbAvKrsRVW2qa88dN"
Message-ID: <02dddf9c-d74d-14b1-48dd-331522e28fe1@linux.intel.com>
Date: Tue, 4 Apr 2023 16:22:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
From: "arun.p.m" <arun.p.m@linux.intel.com>
Subject: Cancelling recurring bi-weekly OpenBMC PMCI WG meetings
To: openbmc@lists.ozlabs.org
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

This is a multi-part message in MIME format.
--------------vEnRehTCbAvKrsRVW2qa88dN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We had very less topics and reduced attendance in last couple of OpenBMC 
PMCI WG meetings. Also, the feedback suggests text-based communication 
is inclusive and more effective to work asynchronously.

Thus cancelling the *recurring *bi-weekly OpenBMC PMCI WG meetings. 
Going forward meetings will be scheduled on need basis. For more details 
please refer - https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG

Thanks,

Arun

--------------vEnRehTCbAvKrsRVW2qa88dN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>We had very less topics and reduced attendance in last couple of
      OpenBMC PMCI WG meetings. Also, the feedback suggests text-based
      communication is inclusive and more effective to work
      asynchronously.</p>
    <p>Thus cancelling the <b>recurring </b>bi-weekly OpenBMC PMCI WG
      meetings. Going forward meetings will be scheduled on need basis.
      For more details please refer - <a moz-do-not-send="true"
        href="https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG"
        class="moz-txt-link-freetext">https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG</a></p>
    <p>Thanks,</p>
    <p>Arun<br>
    </p>
  </body>
</html>

--------------vEnRehTCbAvKrsRVW2qa88dN--

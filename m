Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A43A5A9E1
	for <lists+openbmc@lfdr.de>; Mon, 10 Mar 2025 23:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBXM84d6lz3cjr
	for <lists+openbmc@lfdr.de>; Tue, 11 Mar 2025 09:56:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741647392;
	cv=none; b=gAZBFaRtG4TWICksvKa4gUryK2zV6pZ/6Z5jAkVef204ZEZimR9ex/Obc85Rx9Y3sRGstjslJFWmXLD2ZhV/Rk4E/lnMTaChtIiHa2sttZWh9a4GMFS8u1spXCU/GTXRIigaueC28USIZwqQy4cNdhHmAhVW6ucZFJXAREguMv9gJSUisC3Ywk+MaQDARgvw+twMZTDkWcCtYOOd68tZN2lBQeYU2Jgxi+zpXV/fcA4BmfLTuCUCL+fjRuviyiAO1MXlzQ8pQvveHP01QHtNZrTTQeIefCv3xHX97aEx0IKhHcU7tT4uuICT8XVBJ2CwiSrSNazOQ0Saf9GvZDvkag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741647392; c=relaxed/relaxed;
	bh=CVedBpuLG25Z3jADPUPfXvHH+tXvCIeFrRLb9vuRk1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FSaA14VYHkK7wmte0aZdn9UoeNugifiVtiN7Y0XBluUQY27+GaAWOj4VvdBSYNGXF+1R9eeAOYX68K7w3w72pPXqL8is8jPqWmtmb0Uz4V9MBKcT3FgvNkU7himK42/iOkLhCpQNTZHeuXIRKSqXwF65Sz46N1XLUpRM/JxtoDbXTsu9bZfaiUvTcXCgl681WWEgXhS3fReTJvhuDog0/VbeEyT/Hvarrj1y9D47fbyTQ1cXI5MZUu3iurFPDofQPZ0pgZTtePZwvCb8qYVhH5ffpsNou6aEPbY6tv1xJzn9P1z8430ukeLYESrcDwaQC1HadPRUskJ1YvO8k9MRsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eufu+4Sz; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eufu+4Sz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 11 Mar 2025 09:56:30 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBXM21phjz2yjV
	for <openbmc@lists.ozlabs.org>; Tue, 11 Mar 2025 09:56:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741647391; x=1773183391;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=E7nXpeLnhL9Ur5T6u1bZx50+x9A9C4SuKRBytLQrg5U=;
  b=Eufu+4SzDAMncVdLV4Myk2NWW9IGJ+8I4bKt1sI7d5l/v/xG327MkdL7
   xZrPnGFQ4qTv7RqDpRrlRqVJMvb6seDr3Q1E+NuUGAr+7nD9j8MrGsJAg
   Ed9/2c/cQ9k9jFyFpzmcx6xolm9QEkbGZvBv3510NGYSlILf4dS2b5oJ1
   9gOqpFLtNgXHQqSm2j/8KGjDncBOMOko6o8r3ijCzx9yBBeDRLWo82E+B
   uN4TbhPCYGz8fM2Ha4LO2H3Eqjghyk5kgPBD0m6vkoeykXe90YBqJzV0n
   t0KAidw9FVQTBtnXlWGjLCuegsXxA4deyToMW62hVfeN4xHsGmRhlm47o
   Q==;
X-CSE-ConnectionGUID: 3dryZLb+TqGKjnbQT8OZUQ==
X-CSE-MsgGUID: 8gNqwkngQyuH4tyQaHoVug==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54041377"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="54041377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:55:24 -0700
X-CSE-ConnectionGUID: /f3WomvGR4SrFlq6uVjO/Q==
X-CSE-MsgGUID: 3XnzFz8OSi62ZfZdQDE80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120823257"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 15:55:23 -0700
Received: from [10.124.48.118] (jmbills-mobl1.amr.corp.intel.com [10.124.48.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A413C20B5736
	for <openbmc@lists.ozlabs.org>; Mon, 10 Mar 2025 15:55:22 -0700 (PDT)
Message-ID: <9759ef8b-d4ef-4642-a4a4-7f800f6aad30@linux.intel.com>
Date: Mon, 10 Mar 2025 16:55:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TOF elections for 2025H1
To: openbmc@lists.ozlabs.org
References: <Z8ec-DOTlSM8FMhC@heinlein>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <Z8ec-DOTlSM8FMhC@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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



On 3/4/2025 5:38 PM, Patrick Williams wrote:
> Hello,
> 
> It is time again for TOF elections.  The current roll-call is available
> at:
>      https://github.com/openbmc/tof-election/tree/main/2025H1
> 
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew J., Jason, Patrick, and William.  Due to slipping from
> the developer membership, Jason is not eligible for re-election.
> 
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
> 
> Nominations are due by Sunday March 16th, 2024.  The election, if
> required, will be held immediately after with more details to follow.
> 
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
> 

Thank you all for allowing me to serve on the TOF for the last couple of 
years!  I hope that I have helped the community and provided meaningful 
support during my tenure.

If you are eligible, please consider putting your name up for election 
to help support a our OpenBMC community!

Thanks,
-Jason

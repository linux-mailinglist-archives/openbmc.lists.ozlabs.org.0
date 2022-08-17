Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6475967A0
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 05:05:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6tDN2Wc7z3bl0
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 13:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=iny7+7nu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=iny7+7nu;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6tCx71rSz30Qc
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 13:04:45 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.47.106.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9C3DA213B63C;
	Tue, 16 Aug 2022 20:04:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9C3DA213B63C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1660705453;
	bh=krymhkRVfqtQl/RustWfi4LUzSa/3ZNAyE181kB4GSw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iny7+7nuAbRb32eldtbvBTUMqQ/bvdG3ST0Qk+bcyx6qpYtsUUf50m6EN0FiYxHrk
	 wiYmtU2hKnF5/Z+nt5Fl/K9qKwjP8V1np4I7oMvCkRiYlLTyCBfBGd3v10caqmMwc4
	 hHWRVdwepWHmXnzb1uWgAX4ugQY1sIfyRzLbbb68=
Message-ID: <f4a037ce-c775-df5a-171c-0752dc65dcc8@linux.microsoft.com>
Date: Tue, 16 Aug 2022 20:04:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use
 device tree to configure ECC
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>,
 openbmc@lists.ozlabs.org
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-2-joel@jms.id.au>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <20220817015949.16946-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/16/2022 6:59 PM, Joel Stanley wrote:
> Instead of configuring ECC based on the build config, use a device tree
> property to selectively enable ECC at runtime.
> 
> There are two properties:
> 
>    aspeed,ecc-enabled;
>    aspeed,ecc-size = "512";
> 
> The enabled property is a boolean that enables ECC if it is present.
> 
> The size is the number of MB that should be covered by ECC. Setting it
> to zero, or omitting it, defaults the ECC size to "auto detect".

What's the use case for enabling ECC only on part of the DRAM or not
using max possible DRAM space?

Couldn't this be just simple update based on what DTS memory node has?

/* Update available size */
info->info.size = (((info->info.size / 9) * 8) >> 20) << 20;

Regards,
Dhananjay

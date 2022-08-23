Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9F59CFDA
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 06:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBbbY11S4z3c4S
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 14:19:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=EwO7P78z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=EwO7P78z;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBbbB1jj6z302S
	for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 14:19:18 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.35.69.86])
	by linux.microsoft.com (Postfix) with ESMTPSA id 32D092174E2C;
	Mon, 22 Aug 2022 21:18:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 32D092174E2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1661228325;
	bh=0T7HJhIDNO748A8OxvNVKkDjRNrj+AlscWdVlIpJG84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EwO7P78zzdPTaLeDC6Uu1C52x3AP6z3k42711OxkAZtUuqTjd/v6+fjkRVeLB/n4K
	 9+WjbT3JKuH8HWWNiBlmw1RCZIXnrlMkHzRRpevXtoYCrlrLaUIRtm5665+hQNMrPn
	 P+zjUh750xQ30dXpLa+JTAT7CjIiS4RHx4n+nyKs=
Message-ID: <7c9df7e6-3ad4-e9bc-278d-ff32ae945023@linux.microsoft.com>
Date: Mon, 22 Aug 2022 21:18:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Removing machines using old u-boot tree
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com>
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
Cc: Ryan Sie <ryans@supermicro.com.tw>, =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>, Benjamin Fair <benjaminfair@google.com>, Zev Weiss <zev@bewilderbeest.net>, Vernon Mauery <vernon.mauery@linux.intel.com>, Alexander Amelkin <a.amelkin@yadro.com>, =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>, Brandon Kim <brandonkim@google.com>, Oskar Senft <osk@google.com>, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Andrew Geissler <geisonator@yahoo.com>, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/22/2022 6:13 PM, Joel Stanley wrote:
> Hello machine maintainers,
> 
> The following (see end of email) OpenBMC machines are using the old
> v2016.07 u-boot fork. I would like to see machines updated to use the
> new fork so we can reduce the maintenance burden of u-boot.
> 
> We have two options: move to the newer u-boot fork, or retiring
> (removing) systems that lack the maintenance effort to stay up to
> date.
> 
> The v2019.04 u-boot fork supports both NCSI and direct-PHY network
> configurations. For most systems the steps required to update are:
> 

2019.04 is still old to sustain with backports, e.g. files in common/
were moved around in upstream u-boot.

Looks like much of Aspeed stuff (other than ast2400 and spi driver) has
been upstreamed already. When can openbmc switch to modern upstream tag,
say v2022.07 and stage anything not upstream on top of it in u-boot
mirror?

Thanks,
Dhananjay

Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D590146FE3
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 14:26:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QxXW3GgHzDrcQ
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 22:26:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=andrewnesbit.org
 (client-ip=205.237.194.111; helo=fbo-2.mxes.net;
 envelope-from=ullbeking@andrewnesbit.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=andrewnesbit.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=andrewnesbit.org header.i=@andrewnesbit.org
 header.b="Jzr3All5"; dkim-atps=neutral
X-Greylist: delayed 528 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Jun 2019 22:25:15 AEST
Received: from fbo-2.mxes.net (fbo-2.mxes.net [205.237.194.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QxWb6m4bzDrZh
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 22:25:14 +1000 (AEST)
Received: from smtp-out-1.mxes.net (smtp-out-1.mxes.net [205.237.194.119])
 by fbi-2.mxes.lan (Postfix) with ESMTP id A08AC2755E
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 08:16:31 -0400 (EDT)
Received: from Customer-MUA (mua.mxes.net [10.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.mxes.net (Postfix) with ESMTPSA id 6C56427557;
 Sat, 15 Jun 2019 08:16:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrewnesbit.org;
 s=default; t=1560600980;
 bh=339Lgq7TiRyMBr2XIChEyFSbTnxqiHOkborbHiRD0f4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Jzr3All5DGnhaSzUNcU2U1qQz4rydInZmd4GGJaCxDOwBrjWMUbigtpcMosgMpGVz
 UfQUEDqazjSW5Vcl4x0QdlVY2z83325UTa3uhn9H6w0TMDf1klS2FdxIzLtK8WEF9Y
 MdBhAvwwWIm4lp0Syhlsy0Ox3mdUnx060uQk4Jpk=
Subject: Re: OpenBMC@OCP Technology Day(s)
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <2B4BC3EA-95BD-41E6-98DB-8BA5408598B8@fb.com>
 <59F9D3A0-DDC7-491D-95EB-B745E065E857@fb.com>
From: Andrew Luke Nesbit <ullbeking@andrewnesbit.org>
Openpgp: preference=signencrypt
Message-ID: <6a3a3ba9-33cd-69ca-311c-f86bd25bd363@andrewnesbit.org>
Date: Sat, 15 Jun 2019 13:16:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <59F9D3A0-DDC7-491D-95EB-B745E065E857@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Sent-To: <b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn>
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

On 15/06/2019 12:50, Sai Dasari wrote:
> It was great meetup of our project today at OCP Technology Day@India
> (Thanks to Flipkart!)

I have looked into OCP event locations on a couple of occasions.  Is
there much of an OCP presence in the UK?

Either officially, or some sort of unofficial interest group?
Especially for things like OpenBMC and OpenPOWER.

Kind regards,

Andrew
-- 
OpenPGP key: EB28 0338 28B7 19DA DAB0  B193 D21D 996E 883B E5B9

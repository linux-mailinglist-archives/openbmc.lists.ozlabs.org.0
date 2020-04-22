Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F891B4544
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:38:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496g2f5ZPXzDqNZ
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 22:38:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496fxd3VLFzDqdX
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 22:33:56 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Security Working Group - Wednesday April 1
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
Date: Wed, 22 Apr 2020 08:33:53 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <089D9714-9BE3-468C-A29D-5DEF9FB94191@fuzziesquirrel.com>
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
 <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
 <CADVsX8-2L6umOA8OE-8z3Buu=dKefPJa8KQvycJPPLX9QDz=nQ@mail.gmail.com>
 <CADVsX89dY1YcKmsBvsymb2dGu5_tXQNzmDCgrmf38b0_0T_y4Q@mail.gmail.com>
To: Anton Kachalov <rnouse@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Manojeda@in.ibm.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 5:57 AM, Anton Kachalov <rnouse@google.com> wrote:

> Once such dependencies were dropped, I got a working AppArmor-enabled  
> system with only a 2MB increase.

Hi Anton!

General question about AppArmor - would it require kernel patches to deploy  
it in OpenBMC?

thx - brad

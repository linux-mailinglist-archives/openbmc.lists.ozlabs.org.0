Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD4C4C25BD
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 09:19:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45RN0zhzz30Mj
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 19:19:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=matt@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45R72gwtz2x9b
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:19:15 +1100 (AEDT)
Received: from [192.168.12.102] (unknown [159.196.94.94])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4348A20158;
 Thu, 24 Feb 2022 11:06:40 +0800 (AWST)
Message-ID: <73c46f0b8b609edddad0e314ead38c9b9d72517e.camel@codeconstruct.com.au>
Subject: Re: I3C Binding DSP0233
From: Matt Johnston <matt@codeconstruct.com.au>
To: Rahul Kapoor <rahulkapoor@microsoft.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 24 Feb 2022 11:06:39 +0800
In-Reply-To: <DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9@DM6PR21MB1722.namprd21.prod.outlook.com>
References: <DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9@DM6PR21MB1722.namprd21.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
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

On Wed, 2022-02-23 at 16:45 +0000, Rahul Kapoor wrote:
> Hi,
>  
> I would like to understand if OpenBMC project currently supports MCTP over
> I3C
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0233_1.0.0.pdf
> ? If not, are there plans to support it going forward? We are currently
> using Intel-BMC/libmctp for SMBus binding and plan to transition to in-
> kernel MCTP in future.

Hi Rahul,

I'm not aware of any current work on MCTP-over-I3C for OpenBMC or in-kernel.
It could be added as another in-kernel MCTP transport alongside the current
I2C net driver.

I'm not sure what the current status is for I3C drivers on BMC hardware.
Kernel I3C will only support Linux as an I3C Controller not Target, though
that would suit many setups.

Cheers,
Matt


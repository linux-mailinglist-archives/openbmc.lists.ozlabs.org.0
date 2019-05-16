Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 696942024F
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 11:12:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454QfX4PTqzDqbv
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 19:12:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m0X14i1m"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Qf671Z1zDqVQ
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 19:11:39 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id f1so2033283lfl.6
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=v45gDFstr4RTdnUBXtZTzDERQn0/FyHc7GfgXmIy7wg=;
 b=m0X14i1m6mVyxGFntSsaeVt30NT8cClonmrQc/FIzmhuZeFu5onznAMIaJb7+Ge+N5
 7fmtCwajXAckGkQzRtVResnmvht9II3ApUUGdeiYt3GDPPwN8NyA7WxGyuWtvpJ7WmVW
 BjEjjEKkKyXgainpxmmuNnga0221KrHCR9CHUsN+NDUlvzzZeZe4qiUg7qcBXa3icu3A
 OW+dXIUzNz6agkwBoHuat5PCirltNIKxonSYVplVPRr6yem0xl5hbcRgPpCJ0E3lafNw
 UsAUvbr8Lqanzulz/lV8MZ68hXfjbP1l7AOK7lS68FoHvyGg1TKg9xaxXwYE5a/s7ghe
 gMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=v45gDFstr4RTdnUBXtZTzDERQn0/FyHc7GfgXmIy7wg=;
 b=LIwUQEaE0N0AiWgtl3Zhiczz4uU6qsIS3VNZhmf9E6gbxBvw6jA1ABbKUaQ8V71Xkt
 qJGmMvuSa6k4JGlvLDPp0OAvhGui8b/m6/b44s3z49HvHKu7zDLossn/Ye7ZWspVElXU
 66m9s57fPXr7591LIx2Fi6kIKZrEdkgOSJfDl0MPqSnh8zfOWTBvJEljFHa4+QN/HL5b
 UNw3vEGmMwp/5PnlUQoEDrLTY15xuWcKCoI/N8ySvHPiInq/1jFWsY8JJEjuJ/vb9DCh
 X1QLRHs1ZK8NxLXTgUUYiBbj35cBpZs+k8GuL3h3aqrKooju1KmT31ijXdXyC4t3KC59
 NHBw==
X-Gm-Message-State: APjAAAXnIlYPU3em5IrMVM4HbHNSdgrz3eTUJ9TiQX8nT+A0If9/BfAF
 V9pKte+SqLCDXjfXiLquHFI=
X-Google-Smtp-Source: APXvYqzRpSAjmJofRP8z2wuN+BmwuuXNan+8u1mubO4qBdGItQeBn5m9hMcWZgS02oiJls5w++yr0A==
X-Received: by 2002:a19:8:: with SMTP id 8mr23069660lfa.125.1557997894508;
 Thu, 16 May 2019 02:11:34 -0700 (PDT)
Received: from gmail.com ([89.207.88.249])
 by smtp.gmail.com with ESMTPSA id z6sm778775ljh.61.2019.05.16.02.11.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 02:11:32 -0700 (PDT)
Date: Thu, 16 May 2019 12:11:32 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Neeraj Ladkani <neladk@microsoft.com>
Subject: Re: Add support to debug unresponsive host
Message-ID: <20190516091132.5233hakhib52bf7x@gmail.com>
References: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
 <BL0PR2101MB093284F40176FBC801851059C8090@BL0PR2101MB0932.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL0PR2101MB093284F40176FBC801851059C8090@BL0PR2101MB0932.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
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
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Jayanth Othayoth <ojayanth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have solved a similar task for our VESNIN servers, based on POWER8 CPU
(OpenPOWER platform).

OpenBMC has pdbg debugger (meta-openpower/recipes-bsp/pdbg), this
utility, among other things, can be used to send SRESET signal from
OpenBMC to the host's CPU. As a result of handling the signal, host
side Linux kernel initiates kdump.

This procedure inevitably reboots the host system, whether the host
is working or the system is hung, so it is not a good idea to do this
automatically.
A system administrator initiates the procedure manually from OpenBMC
console.

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.

On Wed, May 15, 2019 at 06:26:08PM +0000, Neeraj Ladkani wrote:
> Some questions.
> 
> 
>   1.  How does BMC know when to trigger NMI? Are we relying on agents to run and send heartbeat? Can this be done agentless ?
>   2.  How do we NMI on non x86 platforms ?
> 
> we should brainstorm to create a generic framework to solve this problem.
> 
> What
> Neeraj
> 
> From: openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> On Behalf Of Jayanth Othayoth
> Sent: Wednesday, May 15, 2019 5:40 AM
> To: openbmc@lists.ozlabs.org; geissonator@gmail.com; bradleyb@fuzziesquirrel.com
> Subject: Add support to debug unresponsive host
> 
> ## Problem Description
> Issue #457:  Add support to debug unresponsive host.
> 
> Scope: High level design direction to solve this problem,
> 
> ## Background and References
> There are situation at customer places where OPAL/Linux goes unresponsive causing a system hang. And there is no way to figure out what went wrong with Linux kernel or OPAL. Looking for a way to trigger a dump capture on Linux host so that we can capture the OS dump for post analysis.
> 
> ## Proposed Design for POWER processor based systems:
> Get all Host CPUs in reset vector and Linux then has a mechanism to patch it into panic-kdump path to trigger dump capture. This will enable us to analyze and fix customer issue where we see Linux hang and unresponsive system.
> 
> ### Redfish Schema used:
> * Reference: DSP2046 2018.3,
> * ComputerSystem 1.6.0 schema provides an action called #ComputerSystem.Reset”, This action is used to reset the system. ResetType parameter is used  for indicating type of reset need to be performed. In this use case we can use “Nmi” type
>     * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86 systems) to cease normal operations, perform diagnostic actions and typically halt the system.  
> * ### d-bus :
> 
> Option 1:   Extending  the existing  d-bus interface  state.Host  name space ( /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interface.yaml ) to support new RequestedHostTransition property called  “Nmi”.   d-bus backend can internally invoke processor specific target to do Sreset( equivalent to x86 NMI) and associated  actions.
> 
> Option 2: Introducing new d-bus interface in the control.state namespace ( /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.interface.yaml) namespace and implement the new d-bus back-end for respective  processor specific targets.
> 
> ## Alternatives Considered
> NA
> 
> ## Impacts:
> NA
> 
> ## Testing
> NA
> 
> Looking for input from the team on this  High level design direction approach.

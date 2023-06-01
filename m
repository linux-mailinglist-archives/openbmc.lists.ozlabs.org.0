Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D9E7195E6
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 10:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX0854n3hz3cgq
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 18:45:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X3xQ0yET;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X3xQ0yET;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX07V52ktz3cfJ
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 18:44:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F81D61798;
	Thu,  1 Jun 2023 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA94C433D2;
	Thu,  1 Jun 2023 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685609090;
	bh=3w3vmVOiVOSwq89LqXs+KywCndxXLf9hKX+g+h8HTzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3xQ0yETPtsHnwVdHaM9/zYQPT3N7Klq5UG6I0la0Jx/lFib+xUwcnM+fQLymvDss
	 dcvz6OgNOTldlS7mS4y7yvabN17vA38grTOv2sMODIQrx0puhPaRoG9+IPFereuRAp
	 da45jzqrKpoJkg97vbisiXfMQTQmRUfy7Fe7MqEs=
Date: Thu, 1 Jun 2023 09:44:47 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI fixes for v6.4
Message-ID: <2023060125-reconvene-prankster-c014@gregkh>
References: <f8506bf66b8bdaa85b5a2bec48bcdcc6a2853da7.camel@intel.com>
 <2023052904-platypus-mower-0e01@gregkh>
 <1693fe7002af39c4efc899a6e60dbafc906d6b25.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1693fe7002af39c4efc899a6e60dbafc906d6b25.camel@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 08:34:21AM +0000, Winiarska, Iwona wrote:
> On Mon, 2023-05-29 at 14:53 +0100, gregkh@linuxfoundation.org wrote:
> > On Mon, May 22, 2023 at 09:24:26PM +0000, Winiarska, Iwona wrote:
> > > Hi Greg,
> > > 
> > > please pull PECI update for Linux v6.4.
> > > 
> > > Thanks
> > > -Iwona
> > > 
> > > The following changes since commit c21c0f9a20a963f5a1874657a4e3d657503f7815:
> > > 
> > >   Binder: Add async from to transaction record (2023-05-13 20:38:12 +0900)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-
> > > fixes-6.4
> > 
> > This includes some random Binder changes that do not belong in my
> > char-misc-linus branch right now for 6.4-final
> 
> Sorry - I based it on char-misc-testing / char-misc-next.
> 
> > 
> > > 
> > > for you to fetch changes up to 849b391254bf64796655868dbb6dee23551ff7d3:
> > > 
> > >   peci: Constify struct peci_controller_ops (2023-05-22 22:16:16 +0200)
> > 
> > Why is this a bugfix that needs to get merged now?  Shouldn't this be
> > for 6.5-rc1?
> 
> It's a small fix - it can wait for 6.5-rc1.

Great, send it now as a patch?

thanks,

greg k-h

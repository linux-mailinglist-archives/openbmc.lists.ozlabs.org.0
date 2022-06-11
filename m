Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CD547243
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 07:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKmxD3n9Zz3c1d
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 15:44:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2yosn8u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B2yosn8u;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKmws5Kw9z3blv
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 15:44:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7DEB8CE39A3;
	Sat, 11 Jun 2022 05:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516A0C34116;
	Sat, 11 Jun 2022 05:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654926248;
	bh=bNJ/EL0jamyP3ajtQm3Cp8mZ0bWZwskKQfExHfBnmMU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B2yosn8uvfbrKAOZHzdoOpCDU8RmlYKVMSplAT7FxaoouqYZBeX72btIDo8UKNNSu
	 wNxSWs6XantGFr2v7xV58Um8FlKs3pL0GIyHua2DdhDGAwBKFR4bE3DlCf2XqsGsPL
	 64AC++OcwLstXPPY3y/IrCheS1L7XD1/u8r/41JNz04b/jR1n/YTbPXlCWLDDLtJRU
	 Q2vjGZuFZkyVB5+sV53NwK3L7xYdp1fznIr7h0zxYyVFTnhCMRl5gF9IgBZNP9NOQZ
	 2Z2/qCMTFs2lSiMYLf2Plt5j6ojSdSuEVcc/2yyw8FyKH9Kf9uQ/7NeI1yJyCQma53
	 hMmSQTtRMon2g==
Date: Fri, 10 Jun 2022 22:44:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH v2 0/6] Configurable VLAN mode for NCSI driver
Message-ID: <20220610224407.4e58dc5a@kernel.org>
In-Reply-To: <6f067302-74a8-702f-bf38-4477a805a528@linux.intel.com>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
	<20220610130903.0386c0d9@kernel.org>
	<3c9fa928-f416-3526-be23-12644d18db3b@linux.intel.com>
	<20220610214506.74c3f89c@kernel.org>
	<6f067302-74a8-702f-bf38-4477a805a528@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 13:18:51 +0800 Jiaqing Zhao wrote:
> All ncsi devices uses the same driver as they uses same command set,
> so the driver doesn't know what modes are supported. And in current
> driver, the vlan related parameters are configured when registering
> the device, adding an ncsi-netlink command to do so seems to be
> unsuitable.

Maybe you could draw a diagram? NC-SI is a bit confusing.

> And adding a netlink command requires extra application in userspace
> to switch the mode. In my opinion, it would be more user-friendly to
> make it usable on boot.

Unfortunately convenience is not reason to start adding system config
into DT.

> Netdev also does not work as the ncsi device itself does not have
> its own netdev, the netdev comes from the mac device. For different
> vlan modes, the netdev feature set of its parent mac device are the
> same.

You say that, yet the command handling already takes into account the
VLAN list:

	if (list_empty(&ndp->vlan_vids)) {

which come from the MAC netdev. What's wrong with setting the filtering
mode based on NETIF_F_HW_VLAN_CTAG_FILTER ?

Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019CA66EB1
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 09:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH54X2fkZz3c9G
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 19:44:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742287481;
	cv=none; b=Ab2pNM+9BazpQgKJ7B+J2be/8i2LzvYoVgbwRRRf+H8IKF1uodIpDcLtBEgGaxmK7amO/djfTNmCMx2j3k4kxbgz+SCGhQ8y0mVqzHeKUq6IWaDDmwUKHDo/YotBVIPwBQVEXay+DDsFEDuoCsLjf0/2XmKyFV/kxLM6tEU5f5Xlpp9BIcmoIrzZjJLVMr9miMKfcI/BGI303k7tHEahNNIfJObwELibs+k/d5o0FDpnsDqA6TywML3AYzFEvESk1ImPoQ6JA0Rrqs6DCLOakeLP0Ciey9jW58oR6IG6BnQzeiOnY1r7D7El+YVesbZFc1ESfygwFQTTSsTxP842lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742287481; c=relaxed/relaxed;
	bh=1HBZdAOBDJbiT3troDQEduecEfz2C1FQBqQQFhxgGMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC0QqdYNCf7CzoOamJxGYPf4fT/kd5iBKItoMyUVe54pHrWK5ZyYTY8a/IJdMmpe04+Ay4a7EDS6YBrkuf3rjJl97PY2fqwNU1vFYi1Dlhkb6nX4gGfhVIss9xoNY6mHE/MgXYTXvtMu8YkQMRIAJUMiKZFBjRk2IONGi22B0Tw0Jo6GG5ss0FXT8aVA9ykSSdF1KOaKUi83I+/j5L1IcphppGZgvHAJecBgM0NtfqJdczW0D6VQ9qu30j48VnTSZP3d7SWRfFtapt0PNGcV56RnMnPcD02Ysn7oXGj2nkVuZeh5XA8v8HWpHE91InSHVeVKSLr5htAmW6G1/qX+eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dcjy9VLp; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dcjy9VLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH54T0Mw4z2ySj;
	Tue, 18 Mar 2025 19:44:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EE7B5C4782;
	Tue, 18 Mar 2025 08:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F26C4CEEE;
	Tue, 18 Mar 2025 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287478;
	bh=NJJzNTRDknJXLfROOfBbxIWmcgwRhNCep316udiZ8FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcjy9VLpm33mUCfRhkjxGfHVKu2TRRnc0L7RRFbXPRNp3r7sRwU+SGolTYvRgxad/
	 FwrYDkGR7UWaS6UxVNa7uaERBHjXdjuxmQRbP8c+eviscDzV3YuXIPRz8lPS6HTKG5
	 j6uKWvegpcFbDrSRVS5iivttq4ClLUl1OeUkF4jHtJ8wYcXkudUmHyg8tyCc+M+2ak
	 I7SCoHCE6aM6LTyiT6cMwfIybdESxIl5J1Q+8et1sTn+FcQm6+4tJAD163vJ6/STnD
	 qs/mAVThJo6P11hvsFWOnyermYuC+S+XHG/WeBWA+DZogl5w6QMgR3i9K6Kt2tDO+W
	 vm8+i7qKpm1kg==
Date: Tue, 18 Mar 2025 09:44:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC
 compatible
Message-ID: <20250318-rapid-coot-of-tact-d779ad@krzk-bin>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 17, 2025 at 11:12:23PM -0500, Rajaganesh Rathinasabapathi wrote:
> Document new AMD Onyx BMC board compatibles
> 
> Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
> ---

Where is the changelog? What happened with this patch between v1 and v3?

Best regards,
Krzysztof


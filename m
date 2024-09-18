Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE997C1CC
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 00:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8CVL3Tksz3bpW
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 08:09:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726697350;
	cv=none; b=QUc9II7wUqO9OktxGk4NGJaHV8vSg9czuyWkbJ86u8rnZ8mGmeVsB5lGHigr+fNbyCSgfl8XkKLAItBpNPnp3uDzO6VCak46q8rzSnxPmPHZCtnTeJJ4z57A6lzUGfmVBx7sx1kpevHD5beEu9Rnw67mzhIKtm/3NZx+HZ6JGrwmNUzw0jWrrtGUZ3AwgwDPAbdfEtKK0EkOoazv8SMNPh9iRJvxdM9L757Dk5CO7eHyPQn/oFhIamHoVV0giF87QFZtddSm6amo25s+BJ1v5u1goJOiER0NYgTtddBzoclUKhyi+G4sj896yCLZK4Httgh03KeSU9D+Ebx6/AiAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726697350; c=relaxed/relaxed;
	bh=1kctRyJt5QTK1UAMopUvGsw8ZXATKsMmHudLyTUCKCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPPNqNiXSEcWlnzp8UZIJ8YdgzKHLJf2+fLRWxThEF8iBiHf2TlhrCQhNQ3+DtMQGxzctOa3D5N2/smfPYsBYk4/NXn03Sw7HPdsi3PSIk4ta/KFOjUe8G1v176NZaMrGFCIWAcSEjn2OyLv+cB+vGKoHMmfOiafc46oHEAWfPaCsmBqMbzWyzsg8uUMi5tTF63xVfqHgiebSe0jBwwgt1eQgGEs8Q0YRj3Kazxq6paYx+KArdfrhclXcKf3OUTkJ7sBgc+dq4hFzcejIxc2Lz8tWWGAD64kFp/snGIwbLddDjIPoCK82nuO6a0aGwVxdwB66LIjurDRnjM/B/6W2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JQLMRa69; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JQLMRa69;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8CVG3v95z2xpf
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 08:09:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5558FA439E9;
	Wed, 18 Sep 2024 22:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC59C4CEC7;
	Wed, 18 Sep 2024 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726697347;
	bh=Xgf+hjqyDaXQyjdCBei1soDh4wnJzkSOhfi7BqmGFxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQLMRa69ANkOzO86vj+aFyam9SUtWY79j5b5oK+jVk2g+eiJz4ve+hHNQgq5lFfgm
	 0oDyzWK3WYz5+AoFxzndeH3Q2jN7HkIEJjtT39gIYGj4b0dx60yDUjgxvqA/FmgrF2
	 ePqzysD3+EVGYacnmxTvkdF05BsvEIpxzIYji7lOiqk2rawjwmlsfUsX8i08taTwgx
	 yyhIYsWR+ccD5kNGm4gDjWu9ab6ucAS6JFn+KxAbjtRY4GVsMvWlTDiYKY9e8Lr6F0
	 ca9crROvWl48dqk3/r3EXaRT6qrmbHedhbwDbdj5E5VDycpeCHvk49gLsj0OBM6WNF
	 +0q03Ne1GEL/Q==
Date: Wed, 18 Sep 2024 17:09:06 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
Message-ID: <20240918220906.GB2216504-robh@kernel.org>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <bc13d8fd-4f03-4445-bc4a-1e0ca7c23ef7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc13d8fd-4f03-4445-bc4a-1e0ca7c23ef7@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2024 at 03:09:23PM +0200, Krzysztof Kozlowski wrote:
> On 18/09/2024 12:32, Chanh Nguyen wrote:
> > Add device tree binding and example for adt7462 device.
> > 
> > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > ---
> >  .../bindings/hwmon/onnn,adt7462.yaml          | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> 
> Where is any user? This is supposed to be sent along driver change
> implementing this compatible.

Since I2C subsystem will strip the vendor prefix and match "adt7462" to 
the existing i2c_device_id, no driver change is needed for it to work. 
Though for good hygene, an of_device_id entry should be added.

Rob

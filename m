Return-Path: <openbmc+bounces-731-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62922BD0996
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 20:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cl7ql4lJxz2yMh;
	Mon, 13 Oct 2025 05:12:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760292755;
	cv=none; b=IyE5o7u/AP1fD9D/hmkUofc4PkggPyCQ9cq48bG+urYHIKDLmAnkFtjlEP3T8wJd0748BpxR8mO/lITr6vX6CCHIrB9pbOIDv+YbOPWAAlMar8dOEEbm7DQFLrld13KEr7IseXrrhUqk/v8oQpat8sQeMs6TF39TT8vjdAPY025EL2h2coj2OKXZmXbJH/msunH02QEQBXL0BDdfBGWTPoivqRtXYvZNNI4dPNaeUA3Ox2V8EAUPnFdpJkuNIbjxxMf5nd85cUcYEL4pKj1oJgX17Of5Pp4c0mCMhQ1AwMZAIx6wM4I1d2T78YjuhLkeGIpvzHuJl13ooJ9fhbZxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760292755; c=relaxed/relaxed;
	bh=VC8GXXSQpIv/LKtCgeHxQw5d2s/g3mf02Ku+jqIhxz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoJhNb+pChN/maNueW322w6qAySqgSSyDLhxA8Wo3gN90IG+DZZHXcTA+rZG9kmheYqJervDU3Jz6AhlJ+ORTHsi6wXXo+WCdq5MS5nxqKy67J28ma2ZXLEOCRWIUQFMsDxI9xVPIQSeUbx2usUtV3nnKMIpR0WjQZpm3ZoyOZJzmUjERb6d5Pu1NbvfnL3QAiN/aU9OzNtNtQwH/+oc/fRE9axr77DQJLHGSAxW8zz0Awe9s8PjQZFhAa36DKCmgqlb4+bbkZY7ordn52q9f3R7QNx49yKdRE2lR6W5h8DqyoGqEpZynAn9ivrQ+HkuJ2QhaWLwEIrWdEJmLavvPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gqIcu9D3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gqIcu9D3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cl7ql0sB3z2xS2
	for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 05:12:35 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b632a6b9effso2155307a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292753; x=1760897553; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VC8GXXSQpIv/LKtCgeHxQw5d2s/g3mf02Ku+jqIhxz8=;
        b=gqIcu9D3EPB5W5qz08SLN66vjNnHaKqiXMF59m2xSEXCD28IzgcLdnjQDqf5xEkp+S
         EGOyALDpGUaJHU4kGE77UfCK+vbpCfyinzdguEPMpbZBrh+XsRbyLlKnxhOd+zHz7P9+
         JBzHqGVehefN82gAKF6eMBa9a8Mu9QzOOdnnmz/IyYC5egs63KZ5OBfOOqRewtjotn7Q
         35u57jtrKW0S99zWfqlsl8lS2ojxLjd71x5YrT3Z+jTnsOGm2Yald8dU8vaQLT3yDeT+
         ApM/v2rO0fI+p30pntdB/XoQvOT1QnxOQm6ANzRnUCUxvawblFU4JLRvqV5A4ojMkw+e
         V9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292753; x=1760897553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC8GXXSQpIv/LKtCgeHxQw5d2s/g3mf02Ku+jqIhxz8=;
        b=UE04AJvL5Q5n3VSdgKnGedCXLQPbnr0+AI8HBqxVcsdTuKnWxB/EnpSqVXx7aHvBMl
         AegB4Q3txzfO/jKAYEuMA8VXaxkdKqXldZGMPsO3wgwyv+1dl88A+J3sjzNPuhtQ9vNf
         qqCqgjK8HowrItH7g5joaIsgZbqQeJV7oMkfx3mQO8ExhC5EWcmlnVTTCqDY43bkQHd+
         9iJS8dF3mzs3Kl8y/tRcpjtPkT94x46v9pvRdlECnCZkmAe8GrtQkzeiaytbcmFz0vpL
         70VEytn8iddPOFjnWLM36MunyO2sCkideSmGhTF5HI79OWB3XuW+KxXtOzGLuwQPVmIe
         iuIg==
X-Forwarded-Encrypted: i=1; AJvYcCWLc1EoP8Arj++5f+CPPgLyASKHK2ZQxERRKgXhF+ZIkWyduUbEgNOIfk+p23a6A0Pa8jqbXYbB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySaZqa6Ear4m1g/kplnmIA/dK9x4gcN/Zu0YOXmE+lTpotyNkc
	GqAZLPuroevOdXWVVEpfrwX9V2QRD3Ciy8XQ58Dqi98xCf2mt5I/tJQFikPm8g==
X-Gm-Gg: ASbGncv0PGPiuoyE7vk8D6DLBogDZoEZywpDsG75on29PCgmmbxLkeF4D0NMh06PNjN
	we56rVba3FXF3whJU8oxK2df5UN4IgbaVUihRWJCLu3LmhvNwVIFyzHiO4e9S4d2ATkHK2ucXUS
	ZAsIXLFOlUEXSJYpWy/O09OG7AnhWgz1fUTE0+F0Nd+4PLYsQ5rxbK5KCGgqO3Q5wncN/rMCN59
	toGeiDrDdqKPSGNNqWzkfVxBVEguKOxYdnDF7rcM0ilTGMvCql/rsP3Z0N2M6dIiA3vOd6wUk3z
	WRoqNdHS0WqgoaCo+ZVvrvp72T2Tmos9ZAqtmskJB1v+xW23/gp1xLwNQ6pbExz3JcvnObbP+tJ
	zbAgFBUfFFHR4aB259/8r1n0GiMzWya2rT0vmGYcb5cpjGaAmYEuXgMK8p33YI2+V
X-Google-Smtp-Source: AGHT+IEGCa6rp5AY25/sXZIN5SM/UqExUQocFllSvQfqN7W2GP0rr3zSmTZkdcqeZqOv2pX50YTOYw==
X-Received: by 2002:a17:903:2d1:b0:24c:965a:f97e with SMTP id d9443c01a7336-29027356aa7mr255105745ad.2.1760292753291;
        Sun, 12 Oct 2025 11:12:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de9febsm112201485ad.7.2025.10.12.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:12:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:12:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
Message-ID: <da2e5d5e-4bd7-46a8-a664-2f5e0d69b28d@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-3-fr0st61te@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-3-fr0st61te@gmail.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 07, 2025 at 12:53:20AM +0300, Ivan Mikhaylov wrote:
> Extend the functionality of hwmon (peci/dimmtemp) for Emerald Rapids
> platform.
> 
> The patch has been tested on a 5S system with 16 DIMMs installed.
> Verified read of DIMM temperature thresholds & temperature.
> 
> Using Sapphire's callbacks about getting thresholds because it's same
> platform/socket.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter


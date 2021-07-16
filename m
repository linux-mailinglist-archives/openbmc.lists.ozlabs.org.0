Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F33CBB49
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 19:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRJKS0FVRz3bSj
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 03:35:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.177;
 helo=mail-il1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRJK92C4Pz2ysq;
 Sat, 17 Jul 2021 03:34:52 +1000 (AEST)
Received: by mail-il1-f177.google.com with SMTP id y6so8958778ilj.13;
 Fri, 16 Jul 2021 10:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iPb7ckziK4kV9zNM6d9iK4b7roci6qqd+Gv92I6XJVU=;
 b=YBEVNXBQ1Jweqc9mQ9OsQySrtSIoa/4tD3JmwH+6nsEdTsPZFrgtHjGh4MXkj9sva5
 SxNSocNjsHoPwz72mS9pI3WDYPMmJFIGNOxov6QXjPimqDwd3d18Vg2z5QgIxG23gnaI
 TvqJONYytjJZhVhIFp6CizmwpCREZOI5Ck27iEqyWlWeoXp+gtR1zltRwfCSxLY+qdpD
 sC5dxIAh92vop5Z7PBxwzArcPzHIIvnwz9CvUWDehIy0xSepmwOpFRbfGbz8c39EvLL3
 trUAKLp+3DrzuzpST+DjDrVm6tYzD1e5gxKReG/RqJuGwkJHgYnZfVxg6F44DnyeBYWJ
 kh3w==
X-Gm-Message-State: AOAM5331Gaf6gQ7l5KQRhBoUldPxwDm4IoBVq/D0FqZiHl26cRwWdgiL
 MaDLj1Qn/udHauLsHLfZ/g==
X-Google-Smtp-Source: ABdhPJyKVjf0100xt5UQ7F9dhFRP/lQhHl+nq9gAbSXPcH5nkSAeXz19sGCDD/0YQ2ZJLRqjQla1Qw==
X-Received: by 2002:a92:c504:: with SMTP id r4mr7106583ilg.131.1626456888668; 
 Fri, 16 Jul 2021 10:34:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a11sm5100043ilf.79.2021.07.16.10.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:34:47 -0700 (PDT)
Received: (nullmailer pid 3643640 invoked by uid 1000);
 Fri, 16 Jul 2021 17:34:43 -0000
Date: Fri, 16 Jul 2021 11:34:43 -0600
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro MFD driver
Message-ID: <20210716173443.GA3643583@robh.at.kernel.org>
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713060031.31568-2-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 13 Jul 2021 13:00:28 +0700, Quan Nguyen wrote:
> Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
> hardware reference platform with Ampere's Altra Processor family.
> 
> The SMpro co-processor on Ampere Altra processor family is to monitor
> and report various data included hwmon-related info, RAS errors, and
> other miscellaneous information.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v5:
>   + Dropped ../bindings/hwmon/ampere,ac01-hwmon.yaml file [Quan]
>   + Removed patternProperties section and child DT nodes in example
>   section [Quan]
>   + Revised commit message [Quan]
> 
> Changes in v4:
>   + Revised the commit message to clarify how the specific info will
>     be handled commented by Rob.
> 
> Changes in v3:
>   + Supported list of compatible string [Rob]
>   + Introduced reg property in DT to specify reg offset [Rob]
>   + Updated description and other minor changes in yaml file [Rob]
> 
> Changes in v2:
>   + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
> 
>  .../devicetree/bindings/mfd/ampere,smpro.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

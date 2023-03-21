Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D28EC6C345E
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 15:36:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgvL35PYwz3ch6
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:36:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YmaItWKw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YmaItWKw;
	dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgvKS0Zl2z2xjw
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 01:35:39 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id p17so5254305ioj.10
        for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLIEUjpPIkk5ZzeFs91fzheQ2P/C6YZLsjoyxu0zBSY=;
        b=YmaItWKwyThfHmmzmWbFEwaB6lWSDyG9F3mZkDIntHl7tNMjJp5VZQLtBR11IIoi8U
         3U/Nl2zoVHdXFK9Me1m4Co/z/LBl8yzcGVdbZ9ZIQw4LQVDnVVTc7vVJlkqUkcUouXMw
         Vy8uednSlQJjcLxBhylmkzq+jEiyvY57lOz0mqK7O3jwzJTInmLFaMhnzC/AgaQfiX9R
         RvXDM/PsFZ+KrVqmjpZggst5V6OzRyRfYr+D0mZXIxy6Y3aJRFzSuFNPWxANq1359InO
         TeB7PkaKFBknkgFtvJoN4RLTqlcwPu1TqgW+CWQ9S+exXicIwPSBkcFEO2iT5m7ggwnF
         K85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLIEUjpPIkk5ZzeFs91fzheQ2P/C6YZLsjoyxu0zBSY=;
        b=B+IB+oRgqhrxqZJ8sahEnOBLyUaMZIT+1SFYl5JZgYunz2Fc1J6JEEG9Zp2HEKrBH6
         wJUv64UvYjUzyYegcpE867YP4EiuKraCi88nKL3WR5cPAvE9O32/3+bj5EZz8xar4ydr
         VHCtu3ZCoW+1ALakEVZVVx4tslReHwCO8fCWz8I0rZCAUzvHxAtbNaVKPT+qjDYz4/Yp
         wJ2EhcaJoOj9CqpNTVsXV3hysMqMhfWfH3cjQIHWpoV+08/NqESNDCcIHbj9es2FAe4L
         Vnjg3H9dbUK5oswqKiH+Ez71/OdUhddp6NrIB1i3bOKlyCah8IOIiUeuVxwq6Hdr6gR2
         P/fg==
X-Gm-Message-State: AO0yUKX6byGrlB2rsdJ+71B/EjeOVwqalMiRRY+J+sTpLK0CSzifNa2Q
	qGfEiO6rZXBJ1SfKEDzizmA=
X-Google-Smtp-Source: AK7set80j+wwwROdSByOE4y0Ml39evb+VWSLcs/srYh+mgkN0R2RD0cTX9+qLbvZ7EwqN3uGWL9t4A==
X-Received: by 2002:a5e:8e09:0:b0:758:6d1e:2978 with SMTP id a9-20020a5e8e09000000b007586d1e2978mr841923ion.10.1679409335658;
        Tue, 21 Mar 2023 07:35:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g8-20020a6b7608000000b0074c7db1470dsm3604347iom.20.2023.03.21.07.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:35:35 -0700 (PDT)
Date: Tue, 21 Mar 2023 07:35:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Message-ID: <b23c180b-667e-4689-a7da-2f8b8902c8cc@roeck-us.net>
References: <20230321090410.866766-1-iwona.winiarska@intel.com>
 <f2fe16cf-3838-df89-958f-c39d1bae81a1@molgen.mpg.de>
 <df6ab72faf9f1484f7f850ad7386f76b60e5bf02.camel@intel.com>
 <ZBmsXYV6jkLiFmJz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBmsXYV6jkLiFmJz@smile.fi.intel.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "jdelvare@suse.com" <jdelvare@suse.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 03:08:45PM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Tue, Mar 21, 2023 at 10:29:22AM +0000, Winiarska, Iwona wrote:
> > On Tue, 2023-03-21 at 10:41 +0100, Paul Menzel wrote:
> > > Am 21.03.23 um 10:04 schrieb Iwona Winiarska:
> 
> ...
> 
> > > This is not aligned. Why not only use one space before the equal sign?
> > 
> > Yeah - same alignment problem is present in cpu_hsx and cpu_icx though, so I
> > just followed along for skx to not stand out visually.
> > So while I agree that alignment is broken here, I think it might be better to
> > separate out the potential cleanup from the fix.
> 
> I agree with Iwona. If community wants a cleanup, it can be created in
> a separate patch. For the fixes it's better to reduce the unrelated churn.
> 

I don't want a cleanup. The original author chose the alignment,
I accepted it because I give submitters some slack when it comes to
formatting as long as checkpatch doesn't complain, and I do not want
to get into lets-change-alignment wars.

Thanks,
Guenter

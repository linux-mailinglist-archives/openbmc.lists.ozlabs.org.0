Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D61E2230
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 19:57:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yyl26fbPzDqRD
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 04:57:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aHkKl3V4"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yykK73S2zDqJQ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 04:56:57 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 23so12592530pgk.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z0n3R/FKIbIF+RCsdCE1KZOxq6ZQFpOd7/WzeB1aBSc=;
 b=aHkKl3V4UW5+3mBT43fvYyQgBqL6TiFH45ZK7cl7CPUPiLv0Qd/2n8OHwC2ZL6i7d3
 Zsf28qhpBbpWXTGTVSakCB3SoVNdHqJWVhGOFLRfQxSbrKU7nHNbtTknCNTou/djWcoJ
 dotLz9Xb8I6hal4Xe4jpo6H2hhyS82kq/bMdFFP2q3a4zaGOTiey6P9SxjQvdqR+DJBx
 sTFlrLaA51TyxoshhWQgG/LxYeWkh4620YTVvt6OtXcKown7sbGlhFPkFNWWYpNBwCTx
 6pCkqzS0E8uTw3rQ4LZ4E+wIf0foFqrS3RxizqMTmqnldVUeP7SD1h58+516hUIW95i9
 g87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0n3R/FKIbIF+RCsdCE1KZOxq6ZQFpOd7/WzeB1aBSc=;
 b=hMBSlnvcB/iALWRF99PQnXMu+k7fe//GEV9D/Ll5vYhStXJ0nz6VeDx5/aC9ym5Z8M
 m7e/7FtQQZFOsQlNdFE/YWB/ddATduJlEn1r2U1njpLlzK2PwwaOpYtFw4aQFyxCOopI
 XC04+jvKo7FJA03PSDqmljZA6KUda5mbkF29JlZa+8oearuRDta5M0yhqSO6YVdshbbR
 ajC+OgnHzCFDv0rKQIWaZa4osTm7zKmXu/yKLH02c/ao7EA4dtKIHrDqnYevvQxEn0dt
 qAn0TV0Xy9e43phUqovNOXN1XzP/qWRMAlRgHWYuVew+YO2IBWPOooZRasKSFlc0JqjH
 0wrQ==
X-Gm-Message-State: APjAAAWeVEG6+kFhQiYoFeg4Vby7duM0HeiR5p+DVLMcbtjawwdc8ZZT
 mC75M3YQ+h9K0T2v4fYEamnflIldQH/cAWQ1yPFJ+A==
X-Google-Smtp-Source: APXvYqyqHGJW7rFf8Ev23OfrVKDpDhNuvyDSR44yD+sGQazaJgErOTpo/Rv9H+M2gu6jXRfOlw5pUMxbdS/TpjuPAEM=
X-Received: by 2002:a17:90a:bf09:: with SMTP id c9mr1581089pjs.9.1571853414074; 
 Wed, 23 Oct 2019 10:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
 <657c3cf2-b6c8-6c02-1397-e09963ebb267@linux.intel.com>
 <CAO=notxLcqmNFDeA+XZFkoe2e2=xyQ6F56_EMRvfx--LfzyvJw@mail.gmail.com>
 <e9672d2c-6825-eab9-1b14-ae94d8b5b792@linux.intel.com>
In-Reply-To: <e9672d2c-6825-eab9-1b14-ae94d8b5b792@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 23 Oct 2019 10:56:43 -0700
Message-ID: <CAO=notxFGf8sYFGqfZuCVeUFyeocBT_TfoZosFa0VTyw8bgBWg@mail.gmail.com>
Subject: Re: PSU Sensors - Associations
To: James Feist <james.feist@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 10:54 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 10/23/19 10:52 AM, Patrick Venture wrote:
> > On Wed, Oct 23, 2019 at 10:50 AM James Feist
> > <james.feist@linux.intel.com> wrote:
> >>
> >> On 10/23/19 10:37 AM, Patrick Venture wrote:
> >>> So, I flipped the association interface addition and the property
> >>> initialization to match other sensors, and then it started working.  I
> >>> was curious if you had any suggestions on how to find the matching
> >>> sensor given the paths, for instance:
> >>>
> >>> busctl get-property xyz.openbmc_project.PSUSensor
> >>> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> >>> xyz.openbmc_project.Association.Definitions Associations
> >>> a(sss) 1 "chassis" "all_sensors"
> >>> "/xyz/openbmc_project/inventory/system/board/Altie"
> >>>
> >>> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
> >>>             |-/xyz/openbmc_project/inventory/system/board/Altie
> >>>             | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
> >>>             | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
> >>>             | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
> >>>             | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
> >>>
> >>> No alt2 -- so how do I know this?  I can walk every subordinate object
> >>> to find the name match, but I was curious if you had a faster idea?
> >>
> >> So for the associations you should generally not look at the definition,
> >> the definition is primarily for the mapper. You should be looking in the
> >> mapper for the association that matches the sensor name that you care
> >> about and it should point back to the configuration. If there are not
> >> associations for each of the sub-sensors, there should be.

I took a look at the ObjectMapper interface you mentioned, and it just
points to the Board, not the individual sensor from the board.

> >
> > I must have looked at the wrong entry there because I didn't see
> > anything pointing back to the sensor config entry, but just the sensor
> > itself.  I'll take a look now, the PSU sensor naming issue is
> > identical to the one if there is just another name available or the
> > Pwm case.
>
> Ah you're right, I don't that that is implemented. Should we create a
> new association for this? It seems useful.

Not that I don't love hearing that I'm right, but in this case I would
have rather been wrong and there been a magic bullet in place that I
had overlooked.

I think all of my association mapping woes would immediately go away
if every sensor pointed to the configuration dbus object that brought
it to life.

>
> >>
> >>>
> >>> Thanks,
> >>> Patrick
> >>>

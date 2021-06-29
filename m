Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C33B77EF
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 20:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDtWX2v4Nz2yPG
	for <lists+openbmc@lfdr.de>; Wed, 30 Jun 2021 04:37:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=FEAe0B+w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=FEAe0B+w; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDtWH6zjsz2yNP
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jun 2021 04:37:29 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id k10so16598lfv.13
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E584y//GWbM4zDAyb0U18cdvtbDSCLDRmQg3TN25KyQ=;
 b=FEAe0B+wb1l81Q+Oj2cSKso0+jTocDi4egh/jtaaNSjSVt3kt+Ja/nW3Pn6HEj0r9U
 uAuw0Z3pgWiwU+nam34FA2ge+jn4zW8w9MypddFwebT+5pRRgd27IDrkxEtS4jFeqG47
 HgATPUdxrmLaH4MLamiKbauASmFMevAai87PCJSLhKgmGqnH4LJIATGralMv/FQPdd9j
 jaXHOQRbREMlhYlR+UazGmgu28RRS5JxGrymj6O7bVROVpTPSVnCgWknwPPMVsLiWtc7
 Jtqd1GbenwWRnjHTg9U3uZtu9XQC1fpqXIDYTey10at/92rSFkL2VUW2vzm8/cQBMdJe
 ePnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E584y//GWbM4zDAyb0U18cdvtbDSCLDRmQg3TN25KyQ=;
 b=REEMi380OriU15fn4YgOgn1HY+OLImq9Ch6l7Gf01iypGeOslSWzjV0YpSNOiPRZwq
 O5SF00ExbCkrQtqMMYQVGygziX0gIRVWmtkgrNJJp3yBnriUTO46AF06Nq1ylTQQhrEV
 OAPZEcs0CYyLkVh07MEMnXSbuOc0gJuKi/0CAZYCRxuUFJulb0X25+G2cIXyjwJeCujv
 tQ1Qa8CyG+lh8+xLrX/1hOIaDUkLlTRJus+jRYd6nXAESb+jWSl0P8Vl9ejyTQXdrFbV
 HQj8mOQka7WTTQzfxo6ddgchjnqYpi3eKOqFM4M/P2bgVeDinQSOgGC5xTEeMJxw5M4w
 Azeg==
X-Gm-Message-State: AOAM5331k+HfaxvECAFUvJlx6+lhio/SG56haO7cyzjlhlyNd027GoYT
 NAtCRBfpwV4vGTXPAZOzTbBs5d5LsMLH2b1x3LL4Wg==
X-Google-Smtp-Source: ABdhPJwaROIMmER1tguN3ZJ7llfztH3hYpqHz6i1fS+p+S3xv6JRtmnqBJ/IrryeBfOJWr7NN22tDdSOlWztPJGVOQI=
X-Received: by 2002:a05:6512:2013:: with SMTP id
 a19mr22171264lfb.504.1624991839315; 
 Tue, 29 Jun 2021 11:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <OF85E3AFDB.E325A182-ON002586FF.00573D13-002586FF.00574B3B@notes.na.collabserv.com>
In-Reply-To: <OF85E3AFDB.E325A182-ON002586FF.00573D13-002586FF.00574B3B@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 29 Jun 2021 11:37:07 -0700
Message-ID: <CACWQX80GeK1ov+81DcMb+3Ygz8FqCPkZY+_VMVAkjg-KocJYeQ@mail.gmail.com>
Subject: Re: Request for a new repository to enable Hardware Isolation (Guard)
To: Ramesh I I1 <rameshi1@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 25, 2021 at 8:54 AM Ramesh I I1 <rameshi1@in.ibm.com> wrote:
>
> Hi All,
>
>
>
> Recently a design document [https://gerrit.openbmc-project.xyz/c/openbmc/=
docs/+/27804] merged to enable the hardware isolation (guard) and it requir=
es a new daemon inside BMC to implement below dbus interfaces.
>
>
>
> DBus Interfaces:
>
> - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+=
/43532
>
> - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+=
/43533
>
> - https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+=
/44229
>
>
>
> The above dbus interface implementation will be host architecture-specifi=
c because of the below reasons.
>
>
>
> - The daemon will create a record (a format used in the OpenPOWER project=
 for isolating hardware) into a partition (which is accessible between BMC =
and host applications in OpenPOWER based systems) and the daemon will creat=
e a dbus entry for the same record.
>
>
>
> - Similarly, the OpenPOWER based host applications will create a record i=
nto a partition and the daemon will create a dbus entry for the same record=
.

So the record storage and ownership will be owned by both the
OpenPOWER host applications and the BMC guard daemon?  In a scenario
where the BMC was managing the given devices, how would that work?
Hypothetically if this were used to implement something like FRB from
the BMC (like other BMC stacks do) how would that work?

>
>
>
> The end goal is, exchanging the isolated hardware details from internal i=
nterfaces (dbus entry) to external interfaces (redfish log entry).
>
>
>
> I had two thoughts about the dbus implementation.
>
>
>
> Option1:
>
>
>
> "New generic daemon" with an extension like how phosphor-logging or phosp=
hor-debug-collector or pldm providing a way to add OEM code.
>
>  - Default case nothing will be there, because we (IBM) are not providing=
 any support through standard host interfaces to isolate hardware.
>
>  - The extension will have OEM-specific implementation.
>
>
>
> Option2:
>
> "New OEM daemon" so, implementation will be OEM specific and platform can=
 get from them respective bitbake meta-layer.
>
>

From my perspective, I would have thought this would be more
distributed;  Each application that wants to implement a "guard"
feature, would expose that through its interfaces, and leave the
implementation details completely to whatever the application itself
wanted to do.  Creating an empty base implementation and expecting
everything that wants to implement this API to extend OEM seems like
it would require a lot of code and a lot of repos.

>
> For Option1, I am wondering about the following scenario.
>
> - If the BMC application (bmcweb) using a generic internal interface (dbu=
s) but, the implementation is OEM specific then, the different system platf=
orms will get a response like "Interface/ObjectPath Not Found" so, the resp=
ective redfish URI (which will be used to do create|list) will fail, right?

If this goes in line with other times we've solved this problem,
bmcweb will call the mapper, and ask it "give me all resources of type
CPU".  Then a subsequent call will be made to determine "for this cpu
dbus path, tell me which daemon implements hardware isolation".  If
the second call fails with not found, generally bmcweb will either
return 404, or fail to populate the property in the Redfish tree
depending on whether you're at collection level or resource level.

>
> - I also heard like the openBMC community nowadays not encouraging the ex=
tension approach into a generic repository for some reason unless there is =
a valid reason.

From my perspective, these OEM extension mechanisms lead to a lack of
discussion and community effort on finding a generic solution.  In
some cases, they might be easier, but personally I think they're worse
for the project overall, even if they do let developers get features
done very quickly.

>
>
>
> For Option2,
>
> - I think bmcweb providing a configuration option (ibm-management-console=
) to use IBM implementation so the new OEM daemon interfaces can be used as=
 OEM code inside the bmcweb so, that we can avoid the above problem from an=
 external interface user perspective for different system platforms.

If you want to put everything within the ibm/v1 tree, feel free, but
make sure you read up on the discussions about the resources that are
there that happened in the past.  ibm/v1 is separate from the redfish
tree, and has some consequences because of that.  With that said, I'm
a little surprised these are OEM records.  I would've assumed that
these guard records would largely just be controlling the "Status"
record on the Redfish tree, and allowing it to be PATCHed to disabled.
Is that what you were thinking?

>
>
>
> The question is, Where I can implement the new daemon? New repository or =
any other existing repository?

We discussed this in the TOF forum, and there were some concerns about
creating a new repository with a new maintainer, and there was a
desire for some sort of co-maintainership model with someone in good
standing in the community, so Ramesh can build up his standing.  Is
anyone else willing to help here?

>
>
>
> If New repository means phosphor-hw-isolation (with extension) or openpow=
er-hw-isolation?
>
>
>
> Any different thoughts or suggestions on the above proposal?
>
>
> Regards,
> Ramesh I
> OpenBMC Developer
> Slack: @rameshi1
> Discord:  @Ramesh I
> E-mail: rameshi1@in.ibm.com
>
>

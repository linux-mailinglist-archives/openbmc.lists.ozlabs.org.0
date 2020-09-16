Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFDF26D129
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 04:32:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsLbh17zZzDrDD
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 12:32:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=209.85.161.65; helo=mail-oo1-f65.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=LVDXAkgg; dkim-atps=neutral
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsLZp6XvjzDqJH
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 12:32:00 +1000 (AEST)
Received: by mail-oo1-f65.google.com with SMTP id r10so201912oor.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 19:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5NzYkEY8PDyaEzn+o32X+D3LDb9BgL6PzKvsryntfCE=;
 b=LVDXAkggHs6k0F9rauSyBomJbYyhdEszaY3rIQKavBHow//0pUoIW/AAlGIi+KxQyp
 27e7MlKCcG4OMX0Yok3o1Y6c+WfpaxnZecQSkgMJfStWHusUvJg+1M+SK+Hvv3hfUNRr
 cWcSIx+t/7tEFG/5fIKxT+uT5xcGq7qmVIqix+GKEM9yNrok8/nwpQaEmgWNgHEjw1Fg
 ug8H2XbXxaOO8mtpiYveB8oZU9eShkTjOJX8T91TwXV2oFOuKZKytbHEVIioerZLOu/b
 rSNOIVak5Ykmr1/i4DdnSEIpfoxbkyiTgydrSZAu1u6XxyEUfWjaDeuJUXuxsHbJpGuM
 Gisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5NzYkEY8PDyaEzn+o32X+D3LDb9BgL6PzKvsryntfCE=;
 b=KNtsEuLNmpwzxloIclN7Sb3pYH+qkhvOW6Ek7MeOzvkINhOLpNach1w+zAsGhUI65D
 Dc/rRjmRaiSUFSGZsSWgfeTFEt3vdGTu6KYLX30EwzjEX1GaOhi1MnWW+eDUm6AN6W4N
 N/X2A+XaOizWQJxPMe8zbEh8Fz4Mad6hOvq4PglCA2bUoZErLwamnIUJLxVNsWb1t2jS
 0LDLFbXbty561MfZF9QL/vGMT47yMJcusaRfkEy+dxu7tikMc7YTccDAgHbtVVx6UeYR
 8DM1gAFS/jTabrKyjYT+rPv83sGBGM/s4XxDgp+uWsGmK9vlqhUP4FOC58mTE2eRKDtP
 bDGw==
X-Gm-Message-State: AOAM5321T2YrpHbrUNBQFHJfXklyOW9W2VTSqF7dkqGNXzv1EqmZ8j5L
 KHfPDEU3hkSM+uxxR3NhoCbtMNIEgGqC0Yi5S+svoy7YQkTJcEJJyqI=
X-Google-Smtp-Source: ABdhPJx+kXc2wSHOmRPzURSjz3BcSvuE6mS8yqJ5TpsCUl0ehkcY5DzHHeGRectOB4S3mLMhjMHje3qJjgb3pm4qc5o=
X-Received: by 2002:a25:1581:: with SMTP id 123mr1779031ybv.480.1600278280635; 
 Wed, 16 Sep 2020 10:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
In-Reply-To: <20200916172045.GD6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 10:44:30 -0700
Message-ID: <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>,
 manoj kiran <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 10:20 AM Patrick Williams <patrick@stwcx.xyz> wrote=
:
>
> On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
> > Hi Ed & James,
> >
> > Till now IBM was using phosphor-settings infrastructure as back-end and=
 uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hp=
p) for setting the IP address of hypervisor. And now we are planning to lev=
erage the capabilities of bios-settings-mgr(backend) as well to set the hyp=
ervisor attributes.
> > do you see any concerns here ?
> > Thanks,
> > Manoj
>
> These end up being two quite different implementations from a dbus
> perspective, which could have implications to Redfish and webui users.
>
> With 'settings' there is no generic settings interfacess on dbus; every
> setting is required to have some modeled interface.  This is great when
> you are exposing some hypervisor setting that the BMC also has for
> itself, such as network.  We have a single dbus interface for all
> network end-points and it doesn't matter if it is for the BMC or the
> Hypervisor.
>
> With 'bios-settings-mgr' there are only generic free-form settings
> values, which presently can be either int64 or string[1].

If this is correct, then I withdraw my support.  I had assumed
bios-settings-mgr would host several objects that contain an
EthernetInterface [1] api, similar to what phosphor-networkd does, and
whose endpoints require no new code in most of the endpoints.  If
we're talking about moving all this to a simple key-value store,
running on yet another representation of what a network interface
looks like, that's going in the wrong direction in terms of fidelity
and complexity.

With that said, if I'm mistaken, let me know.

>  This means
> there is no overlap with any similar settings we have on the BMC and
> there is no programatic way to ensure the data is of the right type and
> named with the right key.  This approach is better when you have large
> numbers of attributes for concepts which the BMC doesn't have itself.
>
> My understanding was that the 'bios-settings-mgr' was typically going to =
be
> used for uploading a large blob of configuration values and the external
> interfaces would have fairly minimal code related to individual
> settings.  My concern with using 'bios-settings-mgr' in general is that
> it will end up being very tight coupling between external interfaces
> (Redfish / webui) and BIOS implementations.  When you use 'settings',
> you can implement much more generic external interface code and likely
> limit the coupling, if any, to the PLDM provider.

I think we have one benefit here in that there's going to be several
implementations of the bios-settings-mgr for the various bios
implementations that will keep us more "honest" about our APIs.  It's
not a satisfying answer, I realize, but I think it's the best we can
do at the moment.

>
> Net is, if you're expecting to be able to modify hypervisor values
> through Redfish or WebUI, I think the best approach is to use
> 'settings'.

The problem with the "settings" approach becomes error handling.
Settingsd has no context of a transaction, or a backend on the other
side, so when and if things fail, they fail silently, or possibly with
a log.  In the case of hosting this API in the BIOS daemon, it can
actually do the "commit" of the parameters to BIOS as part of the dbus
transaction, so once the return code is received from the method call,
the user can know that the values were "latched", and can knowingly
move on.  If they weren't latched, the client can know if it makes
sense to retry, or do some other procedure.
This also has nice properties for the BMC, as it never has to "own"
storage of the data, nor does it have to implement all the validation
routines, as it can rely on the actual data owner to do so.

>
> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde=
54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interfac=
e.yaml#L44
>
> --
> Patrick Williams

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Network/EthernetInterface.interface.yaml

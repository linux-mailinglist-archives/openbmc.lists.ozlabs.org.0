Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAECC8828E
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 20:34:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464v6645hYzDrKV
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 04:34:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oPPN50Yd"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464v5N3mwzzDrCX
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 04:33:43 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id n190so5448700pgn.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMQiG72ANzC0wQcD8f2SdznYY+RWt1GxgOdMgjekwoU=;
 b=oPPN50Yd5ZDTCLxHhbQKCg7UEHT8uOEzJO96kpQ/5r8zO+2qXYw0rfIzyaeI95yKMu
 rSkl8rLuBl9J2SNo5hBMyBF7mHasN/fW28AmiksxQ7vsvva9I1rbevHqg9MkbWzp3LNF
 a0dBVy5JLVoDCxngzSKC9bTjfXUoc8A6CSOM9XU5RXCC/kpTCH04WIc8BWU8xDXyLSHI
 fvUgXby2tY/WD8vK2Go0gU/GmO4fCNBW9/UTQQRek9qaR16PoqQ7yvrBLXXnHgxGVhgF
 oQ7qeP5+Nz47YUj50xbmsJ6Y/na6QUUEZBlMu3SS3jD5Q3RtQNejhD8CX9wN2R5Y74m/
 WIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMQiG72ANzC0wQcD8f2SdznYY+RWt1GxgOdMgjekwoU=;
 b=baTTKXzKu3FKCS1OuFXN7/YJzrEdU9W1FyWej7PKTOFC9uxqeTmAoNzEiJs3emaTqv
 x9yJ8GBa4aa4pw/gCV3wh2Quto/E4z0ZipDtHwqK0aoZZ2idDKW9jONt5r/ywBMem9/W
 m/WdDAI3PIKEa3m9syPIzHvr34+6I8ivHp3e9PuuDnrA/cQQBTf+H7IcfKWVdLAeG54V
 dz06dqtkXwQzbyqR0RkCys1uHwJYhsISvO1Ngw466Wb9UedNNRVWtBVs0y/51O0Ru6zm
 DfyZTSQ1P5T/HsZ7FA+5MO17V8/5/eNYKpn9kRBIpa0Xo4ALbQNvoV7vYABrQwTVNIw/
 c0PQ==
X-Gm-Message-State: APjAAAVHtHHVnfA5ZTB7+jVUpJM3KL598W90js/BbZ4SQt949PXnGisS
 30YmXBPdKVIZp4R0DPKCQOpK1DS8g98j738CJ6r5PA==
X-Google-Smtp-Source: APXvYqxa7iVa/lnau8PnYlt0ABTYAmOCwbuS7I3WbhxWkkVB/+oZvwi6aAmRAwMalTLY1JIrvwI4qKfUe87tGQi+uT0=
X-Received: by 2002:a65:6288:: with SMTP id f8mr18322019pgv.292.1565375619991; 
 Fri, 09 Aug 2019 11:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notycFS1Zhjjt_n5J+mQwLTToZYwW-SM-FKQ-aaeSs4hMUw@mail.gmail.com>
 <56c9b48b-da29-8ec3-dc16-0e37072c2eb7@linux.intel.com>
In-Reply-To: <56c9b48b-da29-8ec3-dc16-0e37072c2eb7@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Aug 2019 11:33:28 -0700
Message-ID: <CAO=notzfd57brCmkUZyegCC9RkwxY1zp9GSXEMt8GGWctX8PhA@mail.gmail.com>
Subject: Re: entity-manager unexpected handling of template parameters
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 11:22 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/9/19 9:53 AM, Patrick Venture wrote:
> > Given the following:
> >
> > busctl introspect --no-pager xyz.openbmc_project.FruDevice
> > /xyz/openbmc_project/FruDevice/Altie
> > NAME                                TYPE      SIGNATURE RESULT/VALUE
> >              FLAGS
> > org.freedesktop.DBus.Introspectable interface -         -
> >              -
> > .Introspect                         method    -         s
> >              -
> > org.freedesktop.DBus.Peer           interface -         -
> >              -
> > .GetMachineId                       method    -         s
> >              -
> > .Ping                               method    -         -
> >              -
> > org.freedesktop.DBus.Properties     interface -         -
> >              -
> > .Get                                method    ss        v
> >              -
> > .GetAll                             method    s         a{sv}
> >              -
> > .Set                                method    ssv       -
> >              -
> > .PropertiesChanged                  signal    sa{sv}as  -
> >              -
> > xyz.openbmc_project.FruDevice       interface -         -
> >              -
> > .ADDRESS                            property  u         82
> >              emits-change
> > .BOARD_LANGUAGE_CODE                property  s         "25"
> >              emits-change
> > .BOARD_MANUFACTURER                 property  s         "Inventec"
> >              emits-change
> > .BOARD_MANUFACTURE_DATE             property  s         "Thu Jul 11
> > 17:09:00 2019" emits-change
> > .BOARD_PART_NUMBER                  property  s         "1051867-01"
> >              emits-change
> > .BOARD_PRODUCT_NAME                 property  s         "Altie"
> >              emits-change
> > .BOARD_SERIAL_NUMBER                property  s
> > "ALTIVT192700026"          emits-change
> > .BUS                                property  u         1
> >              emits-change
> > .Common_Format_Version              property  s         "1"
> >              emits-change
> >
> > I expected entity-manager with this profile to populate dbus properly:
> > configurations/altie.json
> > {
> >      "Name" : "Altie",
> >      "Probe" : "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 'Altie'})",
> >      "Type": "Board",
> >      "xyz.openbmc_project.Inventory.Decorator.Asset": {
> >          "Manufacturer": "$BOARD_MANUFACTURER",
> >          "Model": "$BOARD_PRODUCT_NAME",
> >          "PartNumber": "$BOARD_PART_NUMBER",
> >          "SerialNumber": "$BOARD_SERIAL_NUMBER"
> >      }
> > }
> >
> > Instead:
> > root@semitruck:~# busctl introspect --no-pager
> > xyz.openbmc_project.EntityManager
> > /xyz/openbmc_project/inventory/system/board/Altie
> > NAME                                          TYPE      SIGNATURE
> > RESULT/VALUE                             FLAGS
> > org.freedesktop.DBus.Introspectable           interface -         -
> >                                      -
> > .Introspect                                   method    -         s
> >                                      -
> > org.freedesktop.DBus.Peer                     interface -         -
> >                                      -
> > .GetMachineId                                 method    -         s
> >                                      -
> > .Ping                                         method    -         -
> >                                      -
> > org.freedesktop.DBus.Properties               interface -         -
> >                                      -
> > .Get                                          method    ss        v
> >                                      -
> > .GetAll                                       method    s
> > a{sv}                                    -
> > .Set                                          method    ssv       -
> >                                      -
> > .PropertiesChanged                            signal    sa{sv}as  -
> >                                      -
> > xyz.openbmc_project.AddObject                 interface -         -
> >                                      -
> > .AddObject                                    method    a{sv}     -
> >                                      -
> > xyz.openbmc_project.Inventory.Decorator.Asset interface -         -
> >                                      -
> > .Manufacturer                                 property  s
> > "$BOARD_MANUFACTURER"                    emits-change
> > .Model                                        property  s
> > "$BOARD_PRODUCT_NAME"                    emits-change
> > .PartNumber                                   property  s
> > "$BOARD_PART_NUMBER"                     emits-change
> > .SerialNumber                                 property  s
> > "$BOARD_SERIAL_NUMBER"                   emits-change
> > xyz.openbmc_project.Inventory.Item.Board      interface -         -
> >                                      -
> > .Name                                         property  s
> > "Altie"                                  emits-change
> > .Probe                                        property  s
> > "xyz.openbmc_project.FruDevice({\'BOA... emits-change
> > .Type                                         property  s
> > "Board"                                  emits-change
> >
> > I must be doing something obvious and silly.  Please advise.
>
> Entity-manager caches the result and only updates if etc/os-release
> changes. There is a version file in /var/configuration/version, if you
> delete this it'll rescan fresh. It looks right to me.. so I imagine this
> is what is happening.

I deleted the /var/configuration/version file and rebooted the BMC.
it didn't pick it up -- I decided a rescan was too subtle :)

Any other ideas?  I've started digging into entity-manager further.

>
> -James
> >
> > Thanks,
> > Patrick
> >

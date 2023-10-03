Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F383A7B6A5A
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 15:22:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JQMrkjJ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0JQS5jKKz3c9N
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 00:22:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JQMrkjJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0JPl3CwQz2xrD;
	Wed,  4 Oct 2023 00:21:46 +1100 (AEDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7a52a27fe03so476705241.0;
        Tue, 03 Oct 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696339304; x=1696944104; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi+RGHHOhtPVleGMysrvUidZQaNCF9b1qikITyD52OI=;
        b=JQMrkjJ/JUrcE8eeSlCcahRAJekeigQT+6+4VwrHKUhrij1Ug0ZNy0Sf04Rtw1fInD
         J/7OyLjzhFADN8agfNLHtOSQYtuvzrXLXFsbsKwBLYzbQGxYh1L1D//dah1+lyyUxsyb
         Qw5ekQl+qj/txTnOKpr/q7jtHwHRSQyZWIyaKGh92+ZLe00BLZlQJ+nZ42z5oYDbcJwQ
         CZxi3j8MNFAooG2cdE0Y7YTmqqe2a9nZBNNAUVmlxxa9u/n5Ab5DGpQUmF6UmN+8Ba+l
         wC94Pl9mt16zLZ2yA5ofRVKhcayMZjsVo54LE+GxoaigKIfwljJi1vDLjJzoMb2vjsNy
         0N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696339304; x=1696944104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fi+RGHHOhtPVleGMysrvUidZQaNCF9b1qikITyD52OI=;
        b=LhhNDEYhExo1ZhKG5wBMq05SN1cp9/JFyMuMiefdwg9dAKzRe7dWAuqXa3BHIytwYk
         M2otI4rIAE/6gIOLxhmla9wwK94BSytpWkPO5ucO1ZqgjoFy0ECVAZaZr0ETZeJk7lcF
         qrNvsX9oC50hyyPNW7UA1+jfp79FedfRQ0JhyEDksLcBQxeCr+DFSugkQrLtvYEMSGNI
         5b4/yNr/s5N1uNMT2M/ktGxUkx8LBM/3nRi921K6+vWxhHdBP9Jp2P7sn2WFSV7KsNg4
         z2+EdSDAlgGCS2D7OyfQMSSKcvnIQillArD8s3vY4TRNgWYM9h+e5W+ZLwwvBYg1hfif
         Fzaw==
X-Gm-Message-State: AOJu0YyxY6h/3Qrn7YUpEO65rPLXpyEt+25xz38jAHsjfB/pk4WmIxeK
	K/x58V1/8v/5RftSTcdVY3LX2mAfsGb8PB0nEzFL3zHHCUnSwmUZY4U=
X-Google-Smtp-Source: AGHT+IGtRYR/OptxXTgIRsdUOd0zstJf0gkrw5xb2PgwdX/i/CZMacGoxdqMQvEhxaQdXT9c/oMmcN9fdAlZtMzKH7U=
X-Received: by 2002:a67:ec87:0:b0:452:6d8f:7454 with SMTP id
 h7-20020a67ec87000000b004526d8f7454mr11742094vsp.15.1696339303806; Tue, 03
 Oct 2023 06:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231002143441.545-4-aladyshev22@gmail.com> <202310030640.tYeSJjeI-lkp@intel.com>
In-Reply-To: <202310030640.tYeSJjeI-lkp@intel.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Tue, 3 Oct 2023 16:21:32 +0300
Message-ID: <CACSj6VXZ5V7akgibJcZYxqUy3zFKWA_N_5ua7gzXoEHWRBkkkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mctp: Add MCTP-over-KCS transport binding
To: kernel test robot <lkp@intel.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, edumazet@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, benjaminfair@google.com, openbmc@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, minyard@acm.org, oe-kbuild-all@lists.linux.dev, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Oops, sorry about that.
I've introduced this new warning when I've refactored my code to use
'dev_err_probe'.
I've sent the v3 series to correct the issue, I hope now everything is clea=
r.
I haven't figured out how to run clang in my yocto environment where I
develop code, but the
```
make W=3D1 C=3D1 drivers/net/mctp/mctp-kcs.o
```
runs without any issues now.

Best regards,
Konstantin Aladyshev

On Tue, Oct 3, 2023 at 2:05=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Konstantin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on cminyard-ipmi/for-next]
> [also build test WARNING on linus/master v6.6-rc4 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Aladysh=
ev/ipmi-Move-KCS-headers-to-common-include-folder/20231002-223632
> base:   https://github.com/cminyard/linux-ipmi for-next
> patch link:    https://lore.kernel.org/r/20231002143441.545-4-aladyshev22=
%40gmail.com
> patch subject: [PATCH v2 3/3] mctp: Add MCTP-over-KCS transport binding
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231003=
/202310030640.tYeSJjeI-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231003/202310030640.tYeSJjeI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310030640.tYeSJjeI-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/mctp/mctp-kcs.c: In function 'kcs_bmc_mctp_add_device':
> >> drivers/net/mctp/mctp-kcs.c:494:31: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      494 |                               "alloc_netdev failed for KCS cha=
nnel %d\n",
>          |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>          |                               |
>          |                               char *
>    In file included from include/linux/device.h:15,
>                     from include/linux/acpi.h:14,
>                     from include/linux/i2c.h:13,
>                     from drivers/net/mctp/mctp-kcs.c:16:
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
> >> drivers/net/mctp/mctp-kcs.c:495:38: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      495 |                               kcs_bmc->channel);
>          |                               ~~~~~~~^~~~~~~~~
>          |                                      |
>          |                                      u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>    drivers/net/mctp/mctp-kcs.c:507:25: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      507 |                         "failed to allocate data_in buffer for=
 KCS channel %d\n",
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         char *
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
>    drivers/net/mctp/mctp-kcs.c:508:32: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      508 |                         kcs_bmc->channel);
>          |                         ~~~~~~~^~~~~~~~~
>          |                                |
>          |                                u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>    drivers/net/mctp/mctp-kcs.c:516:25: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      516 |                         "failed to allocate data_out buffer fo=
r KCS channel %d\n",
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         char *
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
>    drivers/net/mctp/mctp-kcs.c:517:32: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      517 |                         kcs_bmc->channel);
>          |                         ~~~~~~~^~~~~~~~~
>          |                                |
>          |                                u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>
>
> vim +/dev_err_probe +494 drivers/net/mctp/mctp-kcs.c
>
>    481
>    482  static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc=
)
>    483  {
>    484          struct mctp_kcs *mkcs;
>    485          struct net_device *ndev;
>    486          char name[32];
>    487          int rc;
>    488
>    489          snprintf(name, sizeof(name), "mctpkcs%d", kcs_bmc->channe=
l);
>    490
>    491          ndev =3D alloc_netdev(sizeof(*mkcs), name, NET_NAME_ENUM,=
 mctp_kcs_setup);
>    492          if (!ndev) {
>    493                  dev_err_probe(kcs_bmc->dev,
>  > 494                                "alloc_netdev failed for KCS channe=
l %d\n",
>  > 495                                kcs_bmc->channel);
>    496                  return -ENOMEM;
>    497          }
>    498
>    499          mkcs =3D netdev_priv(ndev);
>    500          mkcs->netdev =3D ndev;
>    501          mkcs->client.dev =3D kcs_bmc;
>    502          mkcs->client.ops =3D &kcs_bmc_mctp_client_ops;
>    503          mkcs->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFS=
IZ, GFP_KERNEL);
>    504          if (!mkcs->data_in) {
>    505                  dev_err_probe(
>    506                          kcs_bmc->dev,
>    507                          "failed to allocate data_in buffer for KC=
S channel %d\n",
>    508                          kcs_bmc->channel);
>    509                  rc =3D -ENOMEM;
>    510                  goto free_netdev;
>    511          }
>    512          mkcs->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUF=
SIZ, GFP_KERNEL);
>    513          if (!mkcs->data_out) {
>    514                  dev_err_probe(
>    515                          kcs_bmc->dev,
>    516                          "failed to allocate data_out buffer for K=
CS channel %d\n",
>    517                          kcs_bmc->channel);
>    518                  rc =3D -ENOMEM;
>    519                  goto free_netdev;
>    520          }
>    521
>    522          INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
>    523
>    524          rc =3D register_netdev(ndev);
>    525          if (rc)
>    526                  goto free_netdev;
>    527
>    528          spin_lock_irq(&kcs_bmc_mctp_instances_lock);
>    529          list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
>    530          spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
>    531
>    532          dev_info(kcs_bmc->dev, "Add MCTP client for the KCS chann=
el %d",
>    533                   kcs_bmc->channel);
>    534          return 0;
>    535
>    536  free_netdev:
>    537          free_netdev(ndev);
>    538
>    539          return rc;
>    540  }
>    541
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

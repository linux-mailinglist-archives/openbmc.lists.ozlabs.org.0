Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C087A4F0940
	for <lists+openbmc@lfdr.de>; Sun,  3 Apr 2022 14:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KWXq14mQ8z3bYM
	for <lists+openbmc@lfdr.de>; Sun,  3 Apr 2022 22:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oxkwrss0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oxkwrss0; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KWXpZ6vL0z2xZW
 for <openbmc@lists.ozlabs.org>; Sun,  3 Apr 2022 22:12:22 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id s13so9586023ljd.5
 for <openbmc@lists.ozlabs.org>; Sun, 03 Apr 2022 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhuY9InzS2K2Fii8xup6T5VkDWxxG+js+yRhr9okBwM=;
 b=oxkwrss0U0Xp4Bfr2Jb+tSMJoFzVDr+m42B+unrLL6x6sLEksVb+6Z/9Z7hiQ1Dder
 ZPwBtnhG8Ys4FY4WTeBxZ1AQ/LrPtxKhCbf1arFf4bKVAmYYoExmUp5VTj6oWkT8YPqX
 TVqIs09MgcUg6a9nlHlNrIpSizHfUIomTjhrgLjccmDxCg2aS80DYgcp6rudSw/KQ8uh
 ICdEH7RiO1LSzh8grXKNGGm4lsEZ0+z/QSR0vcpELRVcVpucQhxh1I956iW0PS6P3Qff
 XDoAzD5UjdmEy1Wmtict4w3JyLJgF3H5n0pLIWtdBAgDU8CzBa2+2CmiKXClF8yiwbpd
 gAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhuY9InzS2K2Fii8xup6T5VkDWxxG+js+yRhr9okBwM=;
 b=cYJwqEkiIhkK0ZPJXkSVSn5sj8woAttfLvRAMEUI3+YwwbaxtKFa9n/nwAgTkB+6eA
 d166h/9udp34rbvd2EfQLHSBk/kBuRgvwAoGA/cbCN+mIJqegW00AxvxETg6FJwr+AdS
 pRAgV28BuwUAo9CjQwQWDs5FWvmgQfObSd1xgw7VGVXXbWiKf7E1D2/CQVaKDt+734K1
 qScPUYYoOqd9Y0l3kDbjdY2101nhGEeSIV3EdKAXC6NcVSomBXnMdrlVD+10qm0kITwP
 oi8WdJcZ5jD4xQiNucLDYQjLqTiYGTMc7yh9cQFcqTGYIPvXy7axSEfQQ9SPmqm7Tqvs
 oAHg==
X-Gm-Message-State: AOAM5303Z3/F+95xjP4jAcCHHMgbNKqq5yZy9UZBwPlGHwMU3mT7aU8R
 Aph6pej9Unc0KCTVeSMyRRKX+IH2vWZIkbWq6A==
X-Google-Smtp-Source: ABdhPJyGpAXfgSCX/ELloDRiPQUJhykY2xGzNvH+UaBVXBJi9KrHPuFQMssEbYQnQVOgr1C74Wp96BSP2kYR/WIzoHc=
X-Received: by 2002:a2e:2a04:0:b0:24a:ff0b:4838 with SMTP id
 q4-20020a2e2a04000000b0024aff0b4838mr8166114ljq.386.1648987936024; Sun, 03
 Apr 2022 05:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220401002200.27584-1-suichen@google.com>
 <20220401002200.27584-2-suichen@google.com>
In-Reply-To: <20220401002200.27584-2-suichen@google.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 3 Apr 2022 15:12:04 +0300
Message-ID: <CAKKbWA4cuv3mPF9Es-TzV-OtbQuLDJdZNU=uOfZXMYaWD-FWCg@mail.gmail.com>
Subject: Re: [RFC Patch v4 1/1] i2c debug counters as sysfs attributes
To: Sui Chen <suichen@google.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tali Perry <tali.perry1@gmail.com>, krellan@google.com,
 linux-i2c <linux-i2c@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sui,

Do you intend later to push it also to kernel.org?

Avi

On Fri, Apr 1, 2022 at 3:28 AM Sui Chen <suichen@google.com> wrote:
>
> This change renames the I2C debug counters as suggested, and moves their
> processing into the i2c core:
> - bus_errors
> - transfers
> - nacks
> - recovery_successes
> - recovery_failures
> - timeouts
>
> The function i2c_adapter_create_stats_folder creates a stats directory
> in the device's sysfs directory to hold the above debug counters.
>
> Did some brief tests with a few test programs that saves/replays I2C
> trace by reading hwmon sensors. The test program and hardware run in
> QEMU. The test programs are located at
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527
>
> (A normal read)
>
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> 264
> root@gsj:/tmp# ./i2c_bmk_bmc  0
> idx=0
> Processing 1 inputs
> /sys/class/hwmon/hwmon0/temp1_input
> (../../devices/platform/ahb/ahb:apb/f0081000.i2c/i2c-1/1-005c/hwmon/hwmon0):
> 0
> [FindTraceEntries] t0=391.000000 t1=393.000000
> Found 4 interesting I2C trace entries:
>  i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
>  i2c_read: i2c-1 #1 a=05c f=0001 l=2
>  i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
>  i2c_result: i2c-1 n=2 ret=2
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> 265
>
> (Read from an inexistent address, NACK)
>
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> 6
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> 265
>
> root@gsj:/tmp# cat i2c_trace.txt
>  i2c_write: i2c-1 #0 a=0ff f=0000 l=1 [00]
>  i2c_read: i2c-1 #1 a=0ff f=0001 l=2
> root@gsj:/tmp# ./i2c_replay_bmc i2c_trace.txt
> (program runs and completes)
>
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/nacks
> 12
> root@gsj:/tmp# cat /sys/class/i2c-adapter/i2c-1/stats/transfers
> 265
>
> The program makes 2 attempts, performing 3 I2C operations at each
> attempt, which translates to the 6 nack events.
>
> Signed-off-by: Sui Chen <suichen@google.com>
> ---
>  drivers/i2c/i2c-core-base.c | 32 ++++++++++++-
>  drivers/i2c/i2c-dev.c       | 94 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         | 26 ++++++++++
>  3 files changed, 151 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 84f12bf90644..53688b1d855a 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -270,11 +270,22 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
>
>  int i2c_recover_bus(struct i2c_adapter *adap)
>  {
> +
> +       if (adap->stats == NULL)
> +               i2c_adapter_create_stats_directory(adap);
> +
>         if (!adap->bus_recovery_info)
>                 return -EBUSY;
>
>         dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
> -       return adap->bus_recovery_info->recover_bus(adap);
> +       int ret = adap->bus_recovery_info->recover_bus(adap);
> +
> +       if (ret == 0)
> +               ++(adap->stats->recovery_successes);
> +       else
> +               ++(adap->stats->recovery_failures);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_recover_bus);
>
> @@ -2223,6 +2234,23 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>                 trace_i2c_result(adap, num, ret);
>         }
>
> +       if (adap->stats == NULL) {
> +               i2c_adapter_create_stats_directory(adap);
> +       }
> +
> +       if (ret < 0) {
> +               if (ret == -ENXIO)
> +                       ++(adap->stats->nacks);
> +               else if (ret == -ETIMEDOUT)
> +                       ++(adap->stats->timeouts);
> +               else
> +                       ++(adap->stats->bus_errors);
> +       }
> +
> +       if (ret == num) {
> +               ++(adap->stats->transfers);
> +       }
> +
>         return ret;
>  }
>  EXPORT_SYMBOL(__i2c_transfer);
> @@ -2485,6 +2513,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>         }
>
>         kfree(temp_client);
> +       i2c_adapter_create_stats_directory(adapter);
>         return err;
>  }
>
> @@ -2617,6 +2646,7 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
>
>         kfree(buf);
>  }
> +
>  EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
>
>  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> index 77f576e51652..253622706b63 100644
> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -767,6 +767,100 @@ static void __exit i2c_dev_exit(void)
>         unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
>  }
>
> +static struct i2c_adapter *kobj_to_adapter(struct device *pdev)
> +{
> +       struct kobject *dev_kobj;
> +       struct device *dev;
> +
> +       dev_kobj = ((struct kobject *)pdev)->parent;
> +       dev = container_of(dev_kobj, struct device, kobj);
> +       return to_i2c_adapter(dev);
> +}
> +
> +ssize_t bus_errors_show(struct device *pdev,
> +                       struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->bus_errors);
> +}
> +DEVICE_ATTR_RO(bus_errors);
> +
> +ssize_t transfers_show(struct device *pdev,
> +                            struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->transfers);
> +}
> +DEVICE_ATTR_RO(transfers);
> +
> +ssize_t nacks_show(struct device *pdev,
> +                  struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->nacks);
> +}
> +DEVICE_ATTR_RO(nacks);
> +
> +ssize_t recovery_successes_show(struct device *pdev,
> +                               struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_successes);
> +}
> +DEVICE_ATTR_RO(recovery_successes);
> +
> +ssize_t recovery_failures_show(struct device *pdev,
> +                              struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_failures);
> +}
> +DEVICE_ATTR_RO(recovery_failures);
> +
> +ssize_t timeouts_show(struct device *pdev,
> +                     struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->timeouts);
> +}
> +DEVICE_ATTR_RO(timeouts);
> +
> +/**
> + * i2c_adapter_create_stats_directory - creates folder for I2C statistics.
> + * @adapter: the i2c_adapter to create the stats directory for.
> + *
> + * Return: 0 if successful, 1 if failed.
> + */
> +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter)
> +{
> +       struct i2c_adapter_stats *stats;
> +       int ret = 1;
> +
> +       stats = kzalloc(sizeof(*stats), GFP_KERNEL);
> +       if (!stats) {
> +               adapter->stats = NULL;
> +               return ret;
> +       }
> +       adapter->stats = stats;
> +       adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
> +
> +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_transfers.attr);
> +       if (ret)
> +               dev_warn(&adapter->dev, "Failed to create sysfs file for tx_complete_cnt\n");
> +
> +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_bus_errors.attr);
> +       if (ret)
> +               dev_warn(&adapter->dev, "Failed to create sysfs file for bus_errors\n");
> +
> +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nacks.attr);
> +       if (ret)
> +               dev_warn(&adapter->dev, "Failed to create sysfs file for nacks\n");
> +
> +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_successes.attr);
> +       if (ret)
> +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_successes\n");
> +
> +       ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_failures.attr);
> +       if (ret)
> +               dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_failures\n");
> +
> +       return ret;
> +}
> +
>  MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
>  MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
>  MODULE_DESCRIPTION("I2C /dev entries driver");
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 3eb60a2e9e61..c8608378da2a 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -21,6 +21,7 @@
>  #include <linux/of.h>          /* for struct device_node */
>  #include <linux/swab.h>                /* for swab16 */
>  #include <uapi/linux/i2c.h>
> +#include <linux/slab.h> /* for kzalloc */
>
>  extern struct bus_type i2c_bus_type;
>  extern struct device_type i2c_adapter_type;
> @@ -684,6 +685,25 @@ struct i2c_adapter_quirks {
>         u16 max_comb_2nd_msg_len;
>  };
>
> +/**
> + * I2C statistics
> + * The list of statistics are currently copied from npcm7xx.
> + * Perhaps a more universal set of statistics can be used.
> + *
> + * The stats are currently modeled as pointers to members in the bus drivers.
> + * A null pointer indicates the counter is not supported by the bus driver.
> + */
> +struct i2c_adapter_stats {
> +       struct kobject *kobj;
> +
> +       u64 transfers;
> +       u64 bus_errors;
> +       u64 nacks;
> +       u64 recovery_successes;
> +       u64 recovery_failures;
> +       u64 timeouts;
> +};
> +
>  /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
>  #define I2C_AQ_COMB                    BIT(0)
>  /* first combined message must be write */
> @@ -735,12 +755,18 @@ struct i2c_adapter {
>
>         struct i2c_bus_recovery_info *bus_recovery_info;
>         const struct i2c_adapter_quirks *quirks;
> +       struct i2c_adapter_stats *stats;
>
>         struct irq_domain *host_notify_domain;
>         struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>
> +int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
> +
> +void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
> +                                       const char *counter_name, void *data_source);
> +
>  static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
>  {
>         return dev_get_drvdata(&adap->dev);
> --
> 2.35.1.1094.g7c7d902a7c-goog
>


-- 
Regards,
Avi
